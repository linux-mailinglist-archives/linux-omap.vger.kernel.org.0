Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39716245AC
	for <lists+linux-omap@lfdr.de>; Tue, 21 May 2019 03:41:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbfEUBl1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 20 May 2019 21:41:27 -0400
Received: from mga18.intel.com ([134.134.136.126]:39167 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727022AbfEUBl1 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 20 May 2019 21:41:27 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 May 2019 18:41:26 -0700
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 20 May 2019 18:41:25 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1hStmP-0006aZ-6e; Tue, 21 May 2019 09:41:25 +0800
Date:   Tue, 21 May 2019 09:41:20 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     kbuild-all@01.org, linux-omap@vger.kernel.org
Subject: [omap:droid4-pending-mdm-v5.1 8/10] sound/soc/codecs/motmdm.c:39:12:
 sparse: sparse: symbol 'motmd_read_fmt' was not declared. Should it be
 static?
Message-ID: <201905210947.S6UWpK5T%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git droid4-pending-mdm-v5.1
head:   b5de5bd920a448b2ca35f6b6113259beddeda873
commit: 6adb2d19d9267c3f6b0b26f8455b9ba20424e6c2 [8/10] ASoC: audio-graph-card: Add audio mixer for motorold mdm6600
reproduce:
        # apt-get install sparse
        git checkout 6adb2d19d9267c3f6b0b26f8455b9ba20424e6c2
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> sound/soc/codecs/motmdm.c:39:12: sparse: sparse: symbol 'motmd_read_fmt' was not declared. Should it be static?
>> sound/soc/codecs/motmdm.c:45:12: sparse: sparse: symbol 'motmd_write_fmt' was not declared. Should it be static?
>> sound/soc/codecs/motmdm.c:280:51: sparse: sparse: Using plain integer as NULL pointer

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
