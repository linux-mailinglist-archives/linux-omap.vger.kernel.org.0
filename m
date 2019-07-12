Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B03A66425
	for <lists+linux-omap@lfdr.de>; Fri, 12 Jul 2019 04:22:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728916AbfGLCVm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 11 Jul 2019 22:21:42 -0400
Received: from out30-45.freemail.mail.aliyun.com ([115.124.30.45]:50302 "EHLO
        out30-45.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728998AbfGLCVg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Thu, 11 Jul 2019 22:21:36 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R961e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04426;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=22;SR=0;TI=SMTPD_---0TWfV4.F_1562898033;
Received: from localhost(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0TWfV4.F_1562898033)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 12 Jul 2019 10:20:33 +0800
From:   Alex Shi <alex.shi@linux.alibaba.com>
To:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-fbdev@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-s390@vger.kernel.org,
        kvm@vger.kernel.org, linux-sh@vger.kernel.org,
        Sam Bobroff <sbobroff@linux.ibm.com>,
        "Manoj N. Kumar" <manoj@linux.ibm.com>,
        "Matthew R. Ochs" <mrochs@linux.ibm.com>,
        Uma Krishnan <ukrishn@linux.ibm.com>
Subject: [PATCH 08/12] Dcumentation/powerpc: repointer docs to Documentation/arch/
Date:   Fri, 12 Jul 2019 10:20:14 +0800
Message-Id: <20190712022018.27989-8-alex.shi@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.856.g8858448bb
In-Reply-To: <20190712022018.27989-1-alex.shi@linux.alibaba.com>
References: <20190712022018.27989-1-alex.shi@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Since we move Documentation/powerpc docs to Documentation/arch/powerpc
dir, redirect the doc pointer to them.

Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
Cc: Sam Bobroff <sbobroff@linux.ibm.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: "Manoj N. Kumar" <manoj@linux.ibm.com>
Cc: "Matthew R. Ochs" <mrochs@linux.ibm.com>
Cc: Uma Krishnan <ukrishn@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 Documentation/PCI/pci-error-recovery.txt | 2 +-
 Documentation/arch/powerpc/cxlflash.txt  | 2 +-
 MAINTAINERS                              | 8 ++++----
 arch/powerpc/kernel/exceptions-64s.S     | 2 +-
 drivers/soc/fsl/qe/qe.c                  | 2 +-
 drivers/tty/hvc/hvcs.c                   | 2 +-
 include/soc/fsl/qe/qe.h                  | 2 +-
 7 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/PCI/pci-error-recovery.txt b/Documentation/PCI/pci-error-recovery.txt
index 0b6bb3ef449e..339e7394ef1d 100644
--- a/Documentation/PCI/pci-error-recovery.txt
+++ b/Documentation/PCI/pci-error-recovery.txt
@@ -389,7 +389,7 @@ platforms aren't supposed to share interrupts between many devices
 anyway :)
 
 >>> Implementation details for the powerpc platform are discussed in
->>> the file Documentation/powerpc/eeh-pci-error-recovery.txt
+>>> the file Documentation/arch/powerpc/eeh-pci-error-recovery.txt
 
 >>> As of this writing, there is a growing list of device drivers with
 >>> patches implementing error recovery. Not all of these patches are in
diff --git a/Documentation/arch/powerpc/cxlflash.txt b/Documentation/arch/powerpc/cxlflash.txt
index a64bdaa0a1cf..479cdb9a44f4 100644
--- a/Documentation/arch/powerpc/cxlflash.txt
+++ b/Documentation/arch/powerpc/cxlflash.txt
@@ -28,7 +28,7 @@ Introduction
     responsible for the initialization of the adapter, setting up the
     special path for user space access, and performing error recovery. It
     communicates directly the Flash Accelerator Functional Unit (AFU)
-    as described in Documentation/powerpc/cxl.txt.
+    as described in Documentation/arch/powerpc/cxl.txt.
 
     The cxlflash driver supports two, mutually exclusive, modes of
     operation at the device (LUN) level:
diff --git a/MAINTAINERS b/MAINTAINERS
index e1aad1b8224c..7a245d3f02fd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4420,7 +4420,7 @@ F:	arch/powerpc/platforms/powernv/pci-cxl.c
 F:	drivers/misc/cxl/
 F:	include/misc/cxl*
 F:	include/uapi/misc/cxl.h
-F:	Documentation/powerpc/cxl.txt
+F:	Documentation/arch/powerpc/cxl.txt
 F:	Documentation/ABI/testing/sysfs-class-cxl
 
 CXLFLASH (IBM Coherent Accelerator Processor Interface CAPI Flash) SCSI DRIVER
@@ -4431,7 +4431,7 @@ L:	linux-scsi@vger.kernel.org
 S:	Supported
 F:	drivers/scsi/cxlflash/
 F:	include/uapi/scsi/cxlflash_ioctl.h
-F:	Documentation/powerpc/cxlflash.txt
+F:	Documentation/arch/powerpc/cxlflash.txt
 
 CYBERPRO FB DRIVER
 M:	Russell King <linux@armlinux.org.uk>
@@ -9101,7 +9101,7 @@ F:	Documentation/ABI/stable/sysfs-firmware-opal-*
 F:	Documentation/devicetree/bindings/powerpc/
 F:	Documentation/devicetree/bindings/rtc/rtc-opal.txt
 F:	Documentation/devicetree/bindings/i2c/i2c-opal.txt
-F:	Documentation/powerpc/
+F:	Documentation/arch/powerpc/
 F:	arch/powerpc/
 F:	drivers/char/tpm/tpm_ibmvtpm*
 F:	drivers/crypto/nx/
@@ -12235,7 +12235,7 @@ F:	Documentation/PCI/pci-error-recovery.txt
 F:	drivers/pci/pcie/aer.c
 F:	drivers/pci/pcie/dpc.c
 F:	drivers/pci/pcie/err.c
-F:	Documentation/powerpc/eeh-pci-error-recovery.txt
+F:	Documentation/arch/powerpc/eeh-pci-error-recovery.txt
 F:	arch/powerpc/kernel/eeh*.c
 F:	arch/powerpc/platforms/*/eeh*.c
 F:	arch/powerpc/include/*/eeh*.h
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 73ba246ca11d..5fa2a348a28e 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -910,7 +910,7 @@ EXC_COMMON(trap_0b_common, 0xb00, unknown_exception)
  *
  * Call convention:
  *
- * syscall register convention is in Documentation/powerpc/syscall64-abi.txt
+ * syscall register convention is in Documentation/arch/powerpc/syscall64-abi.txt
  *
  * For hypercalls, the register convention is as follows:
  * r0 volatile
diff --git a/drivers/soc/fsl/qe/qe.c b/drivers/soc/fsl/qe/qe.c
index 62c6ba17991a..c83467942b70 100644
--- a/drivers/soc/fsl/qe/qe.c
+++ b/drivers/soc/fsl/qe/qe.c
@@ -419,7 +419,7 @@ static void qe_upload_microcode(const void *base,
 /*
  * Upload a microcode to the I-RAM at a specific address.
  *
- * See Documentation/powerpc/qe_firmware.txt for information on QE microcode
+ * See Documentation/arch/powerpc/qe_firmware.txt for information on QE microcode
  * uploading.
  *
  * Currently, only version 1 is supported, so the 'version' field must be
diff --git a/drivers/tty/hvc/hvcs.c b/drivers/tty/hvc/hvcs.c
index cb4db1b3ca3c..5a1c76055117 100644
--- a/drivers/tty/hvc/hvcs.c
+++ b/drivers/tty/hvc/hvcs.c
@@ -47,7 +47,7 @@
  * using the 2.6 Linux kernel kref construct.
  *
  * For direction on installation and usage of this driver please reference
- * Documentation/powerpc/hvcs.txt.
+ * Documentation/arch/powerpc/hvcs.txt.
  */
 
 #include <linux/device.h>
diff --git a/include/soc/fsl/qe/qe.h b/include/soc/fsl/qe/qe.h
index 3f9d6b6a5691..c07872582b30 100644
--- a/include/soc/fsl/qe/qe.h
+++ b/include/soc/fsl/qe/qe.h
@@ -259,7 +259,7 @@ static inline int qe_alive_during_sleep(void)
 
 /* Structure that defines QE firmware binary files.
  *
- * See Documentation/powerpc/qe_firmware.txt for a description of these
+ * See Documentation/arch/powerpc/qe_firmware.txt for a description of these
  * fields.
  */
 struct qe_firmware {
-- 
2.19.1.856.g8858448bb

