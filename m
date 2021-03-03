Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E290F32C31D
	for <lists+linux-omap@lfdr.de>; Thu,  4 Mar 2021 01:07:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245757AbhCDAAG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 3 Mar 2021 19:00:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1842739AbhCCILR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 3 Mar 2021 03:11:17 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 232EFC06121E;
        Tue,  2 Mar 2021 23:51:36 -0800 (PST)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 421848CA;
        Wed,  3 Mar 2021 08:47:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1614757668;
        bh=2eUYi8WkyCSR/IvUdJsbthJPtQ8SRxzb0VtzXPk/p90=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=dVcgqk6Fgs4I4LnyK+D2lONMjr5SFZ+SWIgq8d+XqaQVuko4jJblguOh7oAL78fjQ
         f9VGFYaxjN/93eV1HvVHDNZlDmUyXQTFJ1DGX798vK+BH7gD2uPrR+G7vKWQjHZTwV
         FKJjBHLWn7p/zWscwc0TJwA2bOHkGiHLs7YTPQp4=
Subject: Re: [PATCHv2 6/6] drm/omapdrm/dss/hdmi5: add CEC support
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Tony Lindgren <tony@atomide.com>, Sekhar Nori <nsekhar@ti.com>,
        dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org
References: <20210302162403.983585-1-hverkuil-cisco@xs4all.nl>
 <20210302162403.983585-7-hverkuil-cisco@xs4all.nl>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <fe8eefe2-16d0-5d15-8a88-508d71a1f505@ideasonboard.com>
Date:   Wed, 3 Mar 2021 09:47:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210302162403.983585-7-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 02/03/2021 18:24, Hans Verkuil wrote:
> Add HDMI CEC support for OMAP5.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>   drivers/gpu/drm/omapdrm/Kconfig          |   8 +
>   drivers/gpu/drm/omapdrm/Makefile         |   1 +
>   drivers/gpu/drm/omapdrm/dss/hdmi.h       |   1 +
>   drivers/gpu/drm/omapdrm/dss/hdmi5.c      |  63 +++++--
>   drivers/gpu/drm/omapdrm/dss/hdmi5_cec.c  | 209 +++++++++++++++++++++++
>   drivers/gpu/drm/omapdrm/dss/hdmi5_cec.h  |  42 +++++
>   drivers/gpu/drm/omapdrm/dss/hdmi5_core.c |  35 +++-
>   drivers/gpu/drm/omapdrm/dss/hdmi5_core.h |  33 +++-
>   8 files changed, 373 insertions(+), 19 deletions(-)
>   create mode 100644 drivers/gpu/drm/omapdrm/dss/hdmi5_cec.c
>   create mode 100644 drivers/gpu/drm/omapdrm/dss/hdmi5_cec.h

<snip>

> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5_core.h b/drivers/gpu/drm/omapdrm/dss/hdmi5_core.h
> index 070cbf5fb57d..a83b634f6011 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi5_core.h
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi5_core.h
> @@ -30,8 +30,18 @@
>   #define HDMI_CORE_IH_PHY_STAT0			0x00410
>   #define HDMI_CORE_IH_I2CM_STAT0			0x00414
>   #define HDMI_CORE_IH_CEC_STAT0			0x00418
> +#define CEC_STAT_DONE				BIT(0)
> +#define CEC_STAT_EOM				BIT(1)
> +#define CEC_STAT_NACK				BIT(2)
> +#define CEC_STAT_ARBLOST			BIT(3)
> +#define CEC_STAT_ERROR_INIT			BIT(4)
> +#define CEC_STAT_ERROR_FOLL			BIT(5)
> +#define CEC_STAT_WAKEUP				BIT(6)
> +
>   #define HDMI_CORE_IH_VP_STAT0			0x0041C
>   #define HDMI_CORE_IH_I2CMPHY_STAT0		0x00420
> +#define HDMI_CORE_IH_MUTE_I2CM_STAT0            0x00614

The line above has indentation in spaces, but everything else uses tabs.

Other than that:

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi
