Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC6C7265DAC
	for <lists+linux-omap@lfdr.de>; Fri, 11 Sep 2020 12:20:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725802AbgIKKUu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Sep 2020 06:20:50 -0400
Received: from mga11.intel.com ([192.55.52.93]:31627 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725786AbgIKKUt (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 11 Sep 2020 06:20:49 -0400
IronPort-SDR: 8YX9Remd3l2lLTjj4iOkxM82aMF/KfdrYaAvIEKuuTEXmbDh00rfAiiA9yCDEBZLllHIt542Yr
 KAVkF0ZIpw1A==
X-IronPort-AV: E=McAfee;i="6000,8403,9740"; a="156184390"
X-IronPort-AV: E=Sophos;i="5.76,414,1592895600"; 
   d="scan'208";a="156184390"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2020 03:20:48 -0700
IronPort-SDR: 15dzaXcgsgYXt4AYcc3A5iChCvN4FCTOymZh2VkBOJjV3LAzVfxbQyqKPSY/EthVV/bwPbErJz
 vyqv0XthIyYw==
X-IronPort-AV: E=Sophos;i="5.76,414,1592895600"; 
   d="scan'208";a="300887620"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2020 03:20:47 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id AAD632079D; Fri, 11 Sep 2020 13:20:45 +0300 (EEST)
Date:   Fri, 11 Sep 2020 13:20:45 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org
Subject: Re: [PATCH 1/1] ARM: dts: n9, n950: Remove nokia,nvm-size property
Message-ID: <20200911102045.GB26842@paasikivi.fi.intel.com>
References: <20200904065811.9312-1-sakari.ailus@linux.intel.com>
 <20200910094409.GA7101@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200910094409.GA7101@atomide.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Sep 10, 2020 at 12:44:09PM +0300, Tony Lindgren wrote:
> * Sakari Ailus <sakari.ailus@linux.intel.com> [200904 10:02]:
> > Remove nokia,nvm-size property as it is no longer needed. The driver can
> > nowadays figure out the size so do not specify it in DT.
> 
> Thanks applying into omap-for-v5.10/dt.

Kiitos!

-- 
Sakari Ailus
