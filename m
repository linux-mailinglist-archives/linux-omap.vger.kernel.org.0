Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92C4C69C8FF
	for <lists+linux-omap@lfdr.de>; Mon, 20 Feb 2023 11:50:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231493AbjBTKut (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 20 Feb 2023 05:50:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231350AbjBTKur (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 20 Feb 2023 05:50:47 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9930193D9
        for <linux-omap@vger.kernel.org>; Mon, 20 Feb 2023 02:50:45 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id ck15so4165351edb.0
        for <linux-omap@vger.kernel.org>; Mon, 20 Feb 2023 02:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v6vcpwkMfGzN9vRBy1DWixkIdHmHqwgh90gCl6PUprg=;
        b=2xvrF9DiUf1wVU0sbqrSYqYY/J46TTjyn+AFw/ZJQqaX3vaiVjroK29XQpSQ6X4uXU
         CqR4k/pUUZHOSeaI+2wOWIQjUPUSZyXIcID9R9tTcT2YRa8wOIn6Dr7h/KfnC4K8gosm
         MjsuU4bRsCeDvCX9duE+M0rYbikkZcSx34NMdWH2ukJcd2yPcDpH/TO2v4fldisKBHx9
         47OXR1yCXBKWIPniESJq28E7wJIa70ouQZWfqRzKxKCK18+ulsnyeVsHgphI0aIfkCZb
         KX2GItPNwYdjRHdjOaNayLCtcpX4x8kYqRhh3/PmApG6U1Rd3ahvqymiAwATdT78ZjHP
         J+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v6vcpwkMfGzN9vRBy1DWixkIdHmHqwgh90gCl6PUprg=;
        b=Vlkl+GPi2Hx+sLMvSReBQoGSnKwCR0cVzbHXM1ffD1XMG9epIAni3C7mzHCxfgq5jy
         jU4Bqvt4whUvYWWYEtz9wz3EqbQ8Xjri0Lo5TBBZVS+uT1xVEPHcpHj2CIyuWSQOsChz
         RCs0cxpZSPafl0d3YU7EHYE7QxoTJFe7d/N9qoZw2CH+mIhOrac/4pD8lUGgy0XhHAOC
         ipV5axCBwE/407ytCB9BOzUvlLGxwcl8rH8NUPjuiWMLCD8NBzrRomcQGsHNvzWi4vHU
         H2hJGPDVQepKkq8G6CXsmlO3xDphhsrN0QugDHE3a53iLCV+O/+BqKHiUp0ws38LsDMB
         Eliw==
X-Gm-Message-State: AO0yUKUp6NZucBO4Mc4FbFTl0EACCurk+FaKe8t+gFSPc+Q+/tMQ+vah
        105LLey7o8DLJx5xydjGUqAxoLWBypRBEa4h/DJ8LQ==
X-Google-Smtp-Source: AK7set9188hMr+cpqZ98qqvqAVQNUFC+YjeVhfGQ2IlXTuOYn1ExJNxWmgV+aqN4Ov3E6ql2A1G9+xnfD6WaYWvd8c4=
X-Received: by 2002:a50:9fa8:0:b0:4ad:6052:ee90 with SMTP id
 c37-20020a509fa8000000b004ad6052ee90mr1324993edf.7.1676890244471; Mon, 20 Feb
 2023 02:50:44 -0800 (PST)
MIME-Version: 1.0
References: <20230219143657.241542-1-daniel.lezcano@linaro.org> <20230219143657.241542-7-daniel.lezcano@linaro.org>
In-Reply-To: <20230219143657.241542-7-daniel.lezcano@linaro.org>
From:   Balsam CHIHI <bchihi@baylibre.com>
Date:   Mon, 20 Feb 2023 11:50:08 +0100
Message-ID: <CAGuA+oqpVX-xQ+00NfcgxuvL=9Jqfi9YhAkvJ+e4gaix2GLn2Q@mail.gmail.com>
Subject: Re: [PATCH v1 06/17] thermal: Don't use 'device' internal thermal
 zone structure field
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     rafael@kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Keerthy <j-keerthy@ti.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:TI BANDGAP AND THERMAL DRIVER" 
        <linux-omap@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, Feb 19, 2023 at 3:38 PM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> Some drivers are directly using the thermal zone's 'device' structure
> field.
>
> Use the driver device pointer instead of the thermal zone device when
> it is available.
>
> Remove the traces when they are duplicate with the traces in the core
> code.
>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---

>  drivers/thermal/mediatek/lvts_thermal.c       |  4 +-

> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index 86d280187c83..a65a81114cc5 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -305,7 +305,7 @@ static int lvts_set_trips(struct thermal_zone_device *tz, int low, int high)
>          * 14-0 : Raw temperature for threshold
>          */
>         if (low != -INT_MAX) {
> -               dev_dbg(&tz->device, "Setting low limit temperature interrupt: %d\n", low);
> +               pr_debug("%s: Setting low limit temperature interrupt: %d\n", tz->type, low);
>                 writel(raw_low, LVTS_H2NTHRE(base));
>         }
>
> @@ -318,7 +318,7 @@ static int lvts_set_trips(struct thermal_zone_device *tz, int low, int high)
>          *
>          * 14-0 : Raw temperature for threshold
>          */
> -       dev_dbg(&tz->device, "Setting high limit temperature interrupt: %d\n", high);
> +       pr_debug("%s: Setting high limit temperature interrupt: %d\n", tz->type, high);
>         writel(raw_high, LVTS_HTHRE(base));
>
>         return 0;

for MediaTek LVTS :

Reviewed-by: Balsam CHIHI <bchihi@baylibre.com>
