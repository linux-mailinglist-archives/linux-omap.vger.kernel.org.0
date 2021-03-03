Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 389AA32C323
	for <lists+linux-omap@lfdr.de>; Thu,  4 Mar 2021 01:07:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232947AbhCDAAE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 3 Mar 2021 19:00:04 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:44845 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1582397AbhCCICw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 3 Mar 2021 03:02:52 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id HMI4lRaOXOruFHMI8lBqgK; Wed, 03 Mar 2021 08:51:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1614757892; bh=BEM3CACPJM7ofFI6RVOnnROC7C6JWyliYyP1layUNnc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=O5JqxmWOE5bK8Bm/KWrZq+HBfY2QL4B9l4r+gLiiiudulq1myWV/k/KSfXzikqPNG
         3WljAs0x5R0HXx4ryjqAyXF7s3xXf5inng/P9KvLmGnfN4qnlEHyG6GhQxG4I8bnF2
         sqRQtCGIL2pnWjQ2LGHDbETHTDoHh68vmpof1negWaqBdF+iwzoh61w77CYrLSvNRz
         SoAhQKdHffji0yG5MHEFI5xpP3ds1CJrd3KhRVjZ6OsOZwKDG6o3hZFgpqM7wreRcY
         dI9TYANl/w8fPNUTb638e5iMVoD4FVCzrBErLCVEJQDNK+UNrCWHB/TbNwWsosgNmo
         3EXg8YwdmccdQ==
Subject: Re: [PATCHv2 6/6] drm/omapdrm/dss/hdmi5: add CEC support
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Tony Lindgren <tony@atomide.com>, Sekhar Nori <nsekhar@ti.com>,
        dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org
References: <20210302162403.983585-1-hverkuil-cisco@xs4all.nl>
 <20210302162403.983585-7-hverkuil-cisco@xs4all.nl>
 <fe8eefe2-16d0-5d15-8a88-508d71a1f505@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <95ec6807-49d1-d9e0-005b-25c65e85ea9b@xs4all.nl>
Date:   Wed, 3 Mar 2021 08:51:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <fe8eefe2-16d0-5d15-8a88-508d71a1f505@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfLUrwz930kT5vBzlfMrsNAetN3XNEhJmBylu1ob6RTqJFIHTHfIgSVEySKEAQ/1hlWi+WOHlIJudAVlm5OPj1ZDLQ3U3rs8oqHj/khWmTT7OC7OZS/Kk
 b/a0lpf7MDdYMbD07IuSgV7t8CKYi+DaBbIHP050VPfRzacNOqL1LaLZ/DfJuqUEkvcxJXRzXqi3UgFBGVhcuGNV5BG+2+KjUsDNCS4yrEZsfwhTrnv4DnMI
 kQqdMkh09T6a1KM6Be7GwowfkMHaLNKXfiJr62s6fjQXtm22DPV1k9IVn64YFpF0udpryh6Sm0O232O8QpTPIrKuHksr/vrRUij2QS/obQUrjR5ElfQC7hDN
 /jNZE20YyqesmqZl4P9aEF9j+QSP3mO4tBacfdHvlmWeYdk+ioNbjAj6PuEnqBPpFhvgrnsmriEj8pqhFDO5HT9nmwZggxn0LS2XjCmJzGRhsKlAx+FcvqK5
 Pp6o07OoLYD4ceM7
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 03/03/2021 08:47, Tomi Valkeinen wrote:
> On 02/03/2021 18:24, Hans Verkuil wrote:
>> Add HDMI CEC support for OMAP5.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>   drivers/gpu/drm/omapdrm/Kconfig          |   8 +
>>   drivers/gpu/drm/omapdrm/Makefile         |   1 +
>>   drivers/gpu/drm/omapdrm/dss/hdmi.h       |   1 +
>>   drivers/gpu/drm/omapdrm/dss/hdmi5.c      |  63 +++++--
>>   drivers/gpu/drm/omapdrm/dss/hdmi5_cec.c  | 209 +++++++++++++++++++++++
>>   drivers/gpu/drm/omapdrm/dss/hdmi5_cec.h  |  42 +++++
>>   drivers/gpu/drm/omapdrm/dss/hdmi5_core.c |  35 +++-
>>   drivers/gpu/drm/omapdrm/dss/hdmi5_core.h |  33 +++-
>>   8 files changed, 373 insertions(+), 19 deletions(-)
>>   create mode 100644 drivers/gpu/drm/omapdrm/dss/hdmi5_cec.c
>>   create mode 100644 drivers/gpu/drm/omapdrm/dss/hdmi5_cec.h
> 
> <snip>
> 
>> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5_core.h b/drivers/gpu/drm/omapdrm/dss/hdmi5_core.h
>> index 070cbf5fb57d..a83b634f6011 100644
>> --- a/drivers/gpu/drm/omapdrm/dss/hdmi5_core.h
>> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi5_core.h
>> @@ -30,8 +30,18 @@
>>   #define HDMI_CORE_IH_PHY_STAT0			0x00410
>>   #define HDMI_CORE_IH_I2CM_STAT0			0x00414
>>   #define HDMI_CORE_IH_CEC_STAT0			0x00418
>> +#define CEC_STAT_DONE				BIT(0)
>> +#define CEC_STAT_EOM				BIT(1)
>> +#define CEC_STAT_NACK				BIT(2)
>> +#define CEC_STAT_ARBLOST			BIT(3)
>> +#define CEC_STAT_ERROR_INIT			BIT(4)
>> +#define CEC_STAT_ERROR_FOLL			BIT(5)
>> +#define CEC_STAT_WAKEUP				BIT(6)
>> +
>>   #define HDMI_CORE_IH_VP_STAT0			0x0041C
>>   #define HDMI_CORE_IH_I2CMPHY_STAT0		0x00420
>> +#define HDMI_CORE_IH_MUTE_I2CM_STAT0            0x00614
> 
> The line above has indentation in spaces, but everything else uses tabs.

Well spotted!

I've fixed that in my tree.

> 
> Other than that:
> 
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Thanks!

	Hans

> 
>   Tomi
> 

