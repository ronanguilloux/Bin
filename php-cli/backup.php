<?php
/** Backup class file
 * Created on 05 2011-07-05 2011 at 09:41
 * @copyright Ronan Guilloux 2011
 * @link https://github.com/ronanguilloux/Scripts/blob/master/backup.php
 * @license http://www.gnu.org/licenses/agpl.txt GNU AFFERO GPL v3
 * @version //autogentag//
 */



// -------------------------------------------------------
// --- Params to change
// -------------------------------------------------------

// TODO :use a .ini file
$root = '/opt/backup/manual';
$additionalBackupFolders = array(
    '/media/usb2ronan/toog/backups',
    '/home/ronan/Ubuntu One/toog'
);
$today = date('Y-m-d-H-i-s');
$archiver = "tar";
$args = "-cjf";
$extension = ".tar.bz2";
$logFile = "backup.log";
$historyFolder = "$root/history";
$backupFolder = "$root/history/$today";
$rootFolder = "/home/ronan";
$minBitSizeRequired = 2000000000; // 2 Gigabits
$email = 'rguilloux@toog.fr';
// Since this could not be perfomed without I/O errors,
// let's starts with the most precious folders...
$folders2tar = array(
    'Workspace',
    'Bureau',
    'Documents',
    'Hobbyspace',
    'Images',
    'Bin',
);

// -------------------------------------------------------
// --- No param to change under this lines
// -------------------------------------------------------
$command = "No command is defined";
$result = "Script did no start yet";
try{

    // 0. removing old backup older than 1 month
    $result = system("find $historyFolder/* -mtime +30 -exec rm -rf {} \;");

    // 1. Creating today's backup folder
    $result = system("mkdir $backupFolder -p \n");

    // 2. Iterating through array, making backups
    foreach($folders2tar as $key=>$folder){
/*
        // check free space size first,
        $command = "du -cbs " . realpath($backupFolder) . " | grep 'total'";
        $size = str_replace("\t","", str_replace('total','',trim(exec($command))));
        echo "\ntaille de " . realpath($backupFolder) . " : $size bits \n";
*/
        $command = "$archiver $args $backupFolder/$folder$extension $rootFolder/$folder";
        $result .= "\n" . system($command);
    }

    // 3. Copying backup into additional folders
    foreach($additionalBackupFolders as $key=>$dir){

        if(is_dir(realpath($dir))){
            // cleaning previous backups
            // TODO : conserve the last days
            $stats = stat(realpath($dir));
            $dateformat = "Y-m-d-H-i-s";
            $realpath = str_replace(' ', '\ ', realpath($dir));
            //$lastmodified = Date::createFormFormat()("Y-m-d H:i:s",($stats['mtime']));
            //echo $lastmodified;
            $command = "rm " . $realpath . "/* -R";
            echo "\n" . $command . "\n";
            $result .= "\n" . system($command);
            // copying
            $command = "cp $backupFolder " . $realpath . " -R";
            echo "\n" . $command . "\n";
            $result .= "\n" . system($command);
        }
    }

    // 4. Tracing
    $result = trim($result);
    file_put_contents($backupFolder.'/'.$logFile, $result);
}
catch (Exception $e){
   $message = "Error raised in " . realpath(__FILE__) . " while attempting to backup ";
   $message .= implode(", ", $folders2tar) . " in " .realpath($backupFolder) . " folder";
   $message .= " using (last command found) : '" . $command ."' command";
   echo $message;
   mail($email, "[Backup error] rootFolder : $rootFolder", $message);
}

?>

