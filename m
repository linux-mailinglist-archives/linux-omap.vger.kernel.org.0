Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71D6C8BB2C
	for <lists+linux-omap@lfdr.de>; Tue, 13 Aug 2019 16:07:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727724AbfHMOHm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 13 Aug 2019 10:07:42 -0400
Received: from mga07.intel.com ([134.134.136.100]:59006 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729306AbfHMOHm (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 13 Aug 2019 10:07:42 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Aug 2019 07:07:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,381,1559545200"; 
   d="scan'208";a="170405185"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga008.jf.intel.com with ESMTP; 13 Aug 2019 07:07:41 -0700
Received: from dalyrusx-mobl.amr.corp.intel.com (unknown [10.251.3.205])
        by linux.intel.com (Postfix) with ESMTP id E8ECD5800FE;
        Tue, 13 Aug 2019 07:07:40 -0700 (PDT)
Subject: Re: [alsa-devel] Regression in next with codec unload and
 snd_soc_component_get/put
To:     Mark Brown <broonie@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc:     alsa-devel@alsa-project.org,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Takashi Iwai <tiwai@suse.de>, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20190809070003.GA52127@atomide.com>
 <s5hwofmhkbs.wl-tiwai@suse.de> <20190809074643.GB52127@atomide.com>
 <s5hv9v6hhm9.wl-tiwai@suse.de> <20190813102451.GJ52127@atomide.com>
 <20190813112920.GC5093@sirena.co.uk>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <76dbd0ed-bbba-1a11-376e-7bf28c78ad9c@linux.intel.com>
Date:   Tue, 13 Aug 2019 09:07:59 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813112920.GC5093@sirena.co.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 8/13/19 6:29 AM, Mark Brown wrote:
> On Tue, Aug 13, 2019 at 03:24:51AM -0700, Tony Lindgren wrote:
>> * Takashi Iwai <tiwai@suse.de> [190809 08:24]:
> 
>>> ... and it was already fixed in the later commit 0e36f36b04e7
>>> "ASoC: soc-core: fix module_put() warning in soc_cleanup_component".
> 
>> Mark, looks like this commit is still not in Linux next, forgot
>> to push out something?
> 
> There's a build failure the Intel guys haven't fixed.

see ('ASoC: SOF: fix HDA direct MMIO access') posted on alsa-devel 
yesterday

https://mailman.alsa-project.org/pipermail/alsa-devel/2019-August/153914.html


