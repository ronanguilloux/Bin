<?php 
/** Backup class file
 * Created on 05 2011-07-05 2011 at 09:41 
 * @author ronan.guilloux
 * @link https://github.com/ronanguilloux/Scripts
 * @license http://www.gnu.org/licenses/agpl.txt GNU AFFERO GPL v3
 * @version //autogentag//
 */
 
// -------------------------------------------------------
// --- Params to change
// ------------------------------------------------------- 

// 0. Settings
$root = '/opt/backup/manual';
$today = date('Y-m-d-H-i-s');
$archiver = "tar";
$args = "-cjf";
$extension = ".tar.bz2";
$logFile = "backup.log";
$backupFolder = "$root/history/$today/";
$rootFolder = "/home/ronan";
$folders2tar = array(
    'Bureau',
    'Documents',
    'Hobbyspace',
    'Images',
    'Programmes',
    'Workspace',
);

// -------------------------------------------------------
// --- No param to change under this lines
// -------------------------------------------------------

// 1. Creating today's backup folder
$result = system("mkdir $backupFolder -p \n");

// 2. Iterating trhow array, making backups
foreach($folders2tar as $key=>$folder){
    $command = "$archiver $args $backupFolder$folder$extension $rootFolder/$folder";
    $result .= "\n" . system($command);
}

// 3. Tracing
$result = trim($result);
file_put_contents($backupFolder.$logFile, $result);

?>

