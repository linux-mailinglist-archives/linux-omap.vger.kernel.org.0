Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32B67100D6B
	for <lists+linux-omap@lfdr.de>; Mon, 18 Nov 2019 22:08:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbfKRVIr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 Nov 2019 16:08:47 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:36732 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726536AbfKRVIr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 18 Nov 2019 16:08:47 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAIL8heu054425;
        Mon, 18 Nov 2019 15:08:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574111323;
        bh=Ui4LBMcBREOjy+QffKyFFviCYaTOb1ZxJoLo/1yq7Gc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=mRi9NlXaFW+aL3GlXojcdEwDGlJiT4VZZ7jM9xTRU8rv5jafLy2K6/xeOs88MbxxZ
         kify/5kuyw1+11HPa9ZrG/IyP5b/QHssbHkWIagrKKrCiy9bFwM5itkAzXjk1tJJqC
         XK1o1DvMYLI4OjCMUW94rtN+cJNG/1e2ej3ERrjQ=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAIL8hsX094917
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 18 Nov 2019 15:08:43 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 18
 Nov 2019 15:08:43 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 18 Nov 2019 15:08:43 -0600
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAIL8gqB041162;
        Mon, 18 Nov 2019 15:08:42 -0600
Subject: Re: [PATCH] ARM: dts: dra7: fix cpsw mdio fck clock
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>
References: <20191118122016.22215-1-grygorii.strashko@ti.com>
 <20191118145000.GA35479@atomide.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <3e4ebb75-52c0-883b-e2f2-1252dcbfff1f@ti.com>
Date:   Mon, 18 Nov 2019 23:08:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191118145000.GA35479@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 18/11/2019 16:50, Tony Lindgren wrote:
> * Grygorii Strashko <grygorii.strashko@ti.com> [191118 12:20]:
>> The DRA7 CPSW MDIO functional clock (gmac_clkctrl DRA7_GMAC_GMAC_CLKCTRL 0)
>> is specified incorrectly, which is caused incorrect MDIO bus clock
>> configuration MDCLK. The correct CPSW MDIO functional clock is
>> gmac_main_clk (125MHz), which is the same as CPSW fck. Hence fix it.
> 
> OK. Is this dra7 only, or are the other mdio clocks changed in commit
> 1faa415c9c6e wrong too?

only DRA7.

-- 
Best regards,
grygorii
