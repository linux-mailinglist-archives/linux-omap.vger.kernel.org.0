Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 431981D6F59
	for <lists+linux-omap@lfdr.de>; Mon, 18 May 2020 05:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbgERDem (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 17 May 2020 23:34:42 -0400
Received: from mga11.intel.com ([192.55.52.93]:60307 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726696AbgERDel (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 17 May 2020 23:34:41 -0400
IronPort-SDR: 9OLaVKhOaw7Y/fuq6DJLVJee7/W59VgIbSCBtHd+8Gr/PhgvahvjfcP2KM8h5lHuzIU6BxWUGB
 +nTBPWJw8qyg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2020 20:34:41 -0700
IronPort-SDR: R7aRXT11qsmARocZ+oiptiFvxO3p4ruB0RhdATPEQtcdkxUXtyvUYqPUFBvb2/nm81Z/91dpFp
 56Bo91Un5GPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,405,1583222400"; 
   d="scan'208";a="342668255"
Received: from pl-dbox.sh.intel.com (HELO intel.com) ([10.239.159.39])
  by orsmga001.jf.intel.com with ESMTP; 17 May 2020 20:34:39 -0700
Date:   Mon, 18 May 2020 11:33:19 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     kbuild-all@lists.01.org, linux-usb@vger.kernel.org,
        linux-omap@vger.kernel.org, Felipe Balbi <balbi@kernel.org>
Subject: [balbi-usb:testing/fixes 2/8] WARNING: simple_strtoul is obsolete,
 use kstrtoul instead
Message-ID: <20200518033319.GC24805@intel.com>
Reply-To: kbuild test robot <lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Heirloom mailx 12.5 6/20/10
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git testing/fixes
head:   172b14b48ca10b280482b164506892ea09edb946
commit: 97df5e5758f7d1dd0ca97e3210696818fc45bdb3 [2/8] usb: raw-gadget: fix gadget endpoint selection

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

scripts/checkpatch.pl 0001-usb-raw-gadget-fix-gadget-endpoint-selection.patch
# many are suggestions rather than must-fix

WARNING: simple_strtoul is obsolete, use kstrtoul instead
#123: drivers/usb/gadget/legacy/raw_gadget.c:261:
+		return simple_strtoul(&name[2], NULL, 10);

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
