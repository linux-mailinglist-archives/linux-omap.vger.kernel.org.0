Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 585F644BE7F
	for <lists+linux-omap@lfdr.de>; Wed, 10 Nov 2021 11:22:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230117AbhKJKZN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 10 Nov 2021 05:25:13 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:49418 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231126AbhKJKZN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 10 Nov 2021 05:25:13 -0500
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 92509D8B;
        Wed, 10 Nov 2021 11:22:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1636539742;
        bh=Kb2mqQcYSIR30c1c/QCzqZNgi4OO/yDrYs6SnhNUIuQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=aPLuUzA685pqCn694mGfTKHYBiuVhIufJVoMO2GulmQVv36CE3Ox+BK4MACzJ+hDp
         8oKRyKHUh5zgtOZOi+SmyS85U7loN3CDuB7b85TZSQgdx7YQjWP0lX8HRyKEE8Npcg
         2Z+4dZxUZ3O9UinQJ7cGN0hnmawutZyeFLSpw6Y0=
Subject: Re: [PATCH] drm/omap: increase DSS5 max tv pclk to 192MHz
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
References: <20211012133939.2145462-1-narmstrong@baylibre.com>
 <b0683f52-abde-cb11-c88c-dd05645945a0@baylibre.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <f6bc98f1-2a1e-1fd9-6efe-37193b835b0d@ideasonboard.com>
Date:   Wed, 10 Nov 2021 12:22:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <b0683f52-abde-cb11-c88c-dd05645945a0@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 09/11/2021 15:33, Neil Armstrong wrote:
> Hi Tomi,
> 
> On 12/10/2021 15:39, Neil Armstrong wrote:
>> From: Tomi Valkeinen <tomi.valkeinen@ti.com>
>>
>> DSS5's maximum tv pclk rate (i.e. HDMI) is set to 186MHz, which comes
>> from the TRM (DPLL_HDMI_CLK1 frequency must be lower than 186 MHz). To
>> support DRA76's wide screen HDMI feature, we need to increase this
>> maximum rate.
>>
>> Testing shows that the PLL seems to work fine even with ~240MHz clocks,
>> and even the HDMI output at that clock is stable enough for monitors to
>> show a picture. This holds true for all DRA7 and AM5 SoCs (and probably
>> also for OMAP5).
>>
>> However, the highest we can go without big refactoring to the clocking
>> code is 192MHz, as that is the DSS func clock we get from the PRCM. So,
>> increase the max HDMI pixel clock to 192MHz for now, to allow some more
>> 2k+ modes to work.
>>
>> This patch never had a clear confirmation from HW people, but this
>> change stayed on production trees for multiple years without any report
>> on an eventual breakage.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>   drivers/gpu/drm/omapdrm/dss/dispc.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> Tomi,
>>
>> I slighly changed the commit message to point the fact this patch has been
>> used in production fort years without any sign of breakage.
>>
>> Neil
>>
>> diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
>> index 5619420cc2cc..3c4a4991e45a 100644
>> --- a/drivers/gpu/drm/omapdrm/dss/dispc.c
>> +++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
>> @@ -4458,7 +4458,7 @@ static const struct dispc_features omap54xx_dispc_feats = {
>>   	.mgr_width_max		=	4096,
>>   	.mgr_height_max		=	4096,
>>   	.max_lcd_pclk		=	170000000,
>> -	.max_tv_pclk		=	186000000,
>> +	.max_tv_pclk		=	192000000,
>>   	.max_downscale		=	4,
>>   	.max_line_width		=	2048,
>>   	.min_pcd		=	1,
>>
>> base-commit: e4e737bb5c170df6135a127739a9e6148ee3da82
>>
> 
> Gentle ping,

Thanks, I'll apply this to drm-misc-next.

  Tomi

