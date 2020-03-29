Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99F63196E17
	for <lists+linux-omap@lfdr.de>; Sun, 29 Mar 2020 17:10:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727816AbgC2PKI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 29 Mar 2020 11:10:08 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.218]:13997 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727729AbgC2PKH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 29 Mar 2020 11:10:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1585494606;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:Cc:Message-Id:Date:Subject:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=s9z5WMgFJ0O3EBetgeyB74TczZ+CT+5YgZe3Zc8q8KQ=;
        b=ohinpD16cV/I7TZW6tpaCy32clUht3QiAfKX/KlVXljBAxeLpQgEhprlRX3gi/KVEi
        0Zb8VADdmxJC9srzwI4RPK0qMxTr2E7BQESpzkyfu12z9JCMjYBDK5Xgj9j7jH1Omnh5
        7nwKcXUvKVa6R5QK1Jm/Nzo6FLfALBEErpe+xgqymqTCR+mdux6sYBLSitr/Kgxw8vAW
        4tB2IM6rsactqHEjFs3/No9Vgh0fUwAs15hIDA1cK4HsZOU97wZR1x0nVuLx9mIr6LGj
        vazP5XcQ9icELzBNJDtka3uPbsb6kwlxSaY8AggNGN9yLpDyg2mQDjdJ8Z/2i9kauGCP
        xM+w==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmMiw43sRNQ="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
        with ESMTPSA id m02241w2TEw1B4O
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Sun, 29 Mar 2020 16:58:01 +0200 (CEST)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Subject: PVR/SGX DDK 1.17 on JZ4780/CI20
Date:   Sun, 29 Mar 2020 16:58:00 +0200
Message-Id: <BDD81F92-79F3-4B48-B21B-705AE435AF4B@goldelico.com>
Cc:     Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
        MIPS Creator CI20 Development 
        <mips-creator-ci20-dev@googlegroups.com>,
        linux-omap <linux-omap@vger.kernel.org>
To:     OpenPVRSGX Linux Driver Group <openpvrsgx-devgroup@letux.org>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,
I have managed to fix some minor issues of the DDK 1.17 source tree =
provided by
Texas Instruments (thanks!) which still contains sgx_jz4780 kernel =
module code.

Attached are first results which show that the driver module can now be =
successfully
built and loaded on the CI20 board.

Next complexity is that there is no MIPS build of the DDK 1.17 =
user-space libs and tools.
So I have installed the ti443x version which seems to support SGX540.

I have started to experiment with "qemu-arm-static pvrsrvctl" but it =
reports missing
ARM libraries which is of course to be expected on a MIPS setup...

But if we can make that work somehow it opens a new way to support other =
SoC as
well: A83, Poulsbo etc. by forward-porting their SoC specific drivers we =
have in some
1.14 trees to 1.17. Or alternatively by developing a really generic =
pvrsrvkm that becomes
SoC-independent.

Code hasn't been pushed to the project git repo since it is does not =
have a linear
history. I plan to push a new rebased release (including these fixes) =
with v5.7-rc1.

BR,
Nikolaus


root@letux:~# cat /etc/debian_version=20
9.12
root@letux:~# uname -a
Linux letux 5.6.0-rc7-letux-l400+ #2356 SMP PREEMPT Sun Mar 29 14:43:33 =
CEST 2020 mips GNU/Linux
root@letux:~# modprobe pvrsrvkm_jz4780_sgx540_120
[ 1485.329869] pvrsrvkm 13040000.gpu: Enabling quirks 00000000
[ 1485.353477] [drm] Initialized pvr 1.17.4948957 20110701 for =
13040000.gpu on minor 1
root@letux:~# lsmod
Module                  Size  Used by
pvrsrvkm_jz4780_sgx540_120   338691  0
g_ether                 5373  0
usb_f_rndis            17648  1 g_ether
u_ether                13532  2 g_ether,usb_f_rndis
libcomposite           48008  2 g_ether,usb_f_rndis
configfs               32565  3 usb_f_rndis,libcomposite
dw_hdmi_jz4780          2103  0
ingenic_drm             9582  0
dw_hdmi                27893  1 dw_hdmi_jz4780
drm_kms_helper        195676  3 ingenic_drm,dw_hdmi
syscopyarea             2754  1 drm_kms_helper
sysfillrect             3338  1 drm_kms_helper
sysimgblt               2140  1 drm_kms_helper
fb_sys_fops             1803  1 drm_kms_helper
drm                   485544  5 =
ingenic_drm,pvrsrvkm_jz4780_sgx540_120,dw_hdmi,drm_kms_helper
gpio_ir_recv            2798  0
gpio_keys               9881  0
dm9000                 18156  0
rtc_pcf8563             7287  1
nvmem_jz4780_efuse      3248  0
mii                     7162  1 dm9000
drm_panel_orientation_quirks      942  1 drm
ipv6                  410154  24
autofs4                26479  9
root@letux:~# ls -l /proc/pvr/
total 0
-r--r--r-- 1 root root 0 Mar 29 14:17 nodes
-r--r--r-- 1 root root 0 Mar 29 14:17 queue
-r--r--r-- 1 root root 0 Mar 29 14:17 version
root@letux:~# cat /proc/pvr/*    =20
Registered nodes
Addr     Type     Class    Index Ref pvDev     Size Res
e4186696 ?7       3D          0   1  da3ed53d    0  4ea4f1a1
Command Queues
Queue    CmdPtr      Pid Command Size DevInd  DSC  SSC  #Data ...
Version SGX_DDK sgxddk 1.17@4948957 (release) omap_sgx
System Version String: None
root@letux:~# ls -l /dev/dri
total 0
crw-rw---- 1 root video 226,   0 Nov  3  2016 card0
crw-rw---- 1 root video 226,   1 Mar 29 14:15 card1
crw-rw---- 1 root video 226, 128 Mar 29 14:15 renderD128
root@letux:~# cat /proc/cpuinfo=20
system type             : JZ4780
machine                 : img,ci20
processor               : 0
cpu model               : Ingenic XBurst V4.15  FPU V0.0
BogoMIPS                : 1196.85
wait instruction        : yes
microsecond timers      : no
tlb_entries             : 32
extra interrupt vector  : yes
hardware watchpoint     : yes, count: 1, address/irw mask: [0x0fff]
isa                     : mips1 mips2 mips32r1 mips32r2
ASEs implemented        :
shadow register sets    : 1
kscratch registers      : 0
package                 : 0
core                    : 0
VCED exceptions         : not available
VCEI exceptions         : not available

processor               : 1
cpu model               : Ingenic XBurst V4.15  FPU V0.0
BogoMIPS                : 1202.58
wait instruction        : yes
microsecond timers      : no
tlb_entries             : 32
extra interrupt vector  : yes
hardware watchpoint     : yes, count: 1, address/irw mask: [0x0fff]
isa                     : mips1 mips2 mips32r1 mips32r2
ASEs implemented        :
shadow register sets    : 1
kscratch registers      : 0
package                 : 0
core                    : 1
VCED exceptions         : not available
VCEI exceptions         : not available

root@letux:~# qemu-arm-static /usr/bin/pvrsrvctl --start --no-module
/lib/ld-linux-armhf.so.3: No such file or directory
root@letux:~#=20



