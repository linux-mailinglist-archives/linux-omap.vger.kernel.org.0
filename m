Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B42C920EA31
	for <lists+linux-omap@lfdr.de>; Tue, 30 Jun 2020 02:30:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728080AbgF3AaO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 29 Jun 2020 20:30:14 -0400
Received: from mga06.intel.com ([134.134.136.31]:25884 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726119AbgF3AaN (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 29 Jun 2020 20:30:13 -0400
IronPort-SDR: gzZe2t9FbF9vdH+k+xWyKUHGvxyUbY/qlrld2kMBAaSeYj0RYX2htU0KvYFmZ+8wdMyaBrzwBq
 TUOGEsqKP0+A==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="207626205"
X-IronPort-AV: E=Sophos;i="5.75,296,1589266800"; 
   d="scan'208";a="207626205"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2020 17:30:12 -0700
IronPort-SDR: nEyz01hyNnqJMsRF4MVP7RQLEpWQpV9kfeu/z2g6UKfbjDr0+abK97ipTl9QvRzquqAd4D3x1Q
 xBbfQeIDVmRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,296,1589266800"; 
   d="scan'208";a="266336505"
Received: from shao2-debian.sh.intel.com (HELO [10.239.13.3]) ([10.239.13.3])
  by fmsmga008.fm.intel.com with ESMTP; 29 Jun 2020 17:30:09 -0700
Subject: Re: [kbuild-all] Re: [PATCH] ARM: dts: omap3: Migrate AES from hwmods
 to sysc-omap2
To:     Tony Lindgren <tony@atomide.com>, kernel test robot <lkp@intel.com>
Cc:     Adam Ford <aford173@gmail.com>, linux-omap@vger.kernel.org,
        kbuild-all@lists.01.org, aford@beaconembedded.com,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Walmsley <paul@pwsan.com>,
        Russell King <linux@armlinux.org.uk>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200617105840.22138-1-aford173@gmail.com>
 <202006180107.6NIzI00f%lkp@intel.com> <20200629181250.GY37466@atomide.com>
From:   Rong Chen <rong.a.chen@intel.com>
Message-ID: <c30dd2e4-0f80-9caf-0cfa-45a60a2d1319@intel.com>
Date:   Tue, 30 Jun 2020 08:29:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200629181250.GY37466@atomide.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 6/30/20 2:12 AM, Tony Lindgren wrote:
> * kernel test robot <lkp@intel.com> [200617 17:28]:
>> Hi Adam,
>>
>> Thank you for the patch! Yet something to improve:
>>
>> [auto build test ERROR on omap/for-next]
>> [cannot apply to balbi-usb/testing/next]
>> [if your patch is applied to the wrong git tree, please drop us a note to help
>> improve the system. BTW, we also suggest to use '--base' option to specify the
>> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
> This applies to v5.8-rc1, so the error above can be ignored now.
>
> Applying patch into omap-for-v5.9/ti-sysc-drop-pdata.

Hi Tony,

Thanks for the feedback, we'll fix the wrong base.

Best Regards,
Rong Chen
