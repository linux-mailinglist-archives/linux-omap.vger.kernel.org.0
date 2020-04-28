Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B787B1BCD7F
	for <lists+linux-omap@lfdr.de>; Tue, 28 Apr 2020 22:34:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgD1UeK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 Apr 2020 16:34:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726291AbgD1UeK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Tue, 28 Apr 2020 16:34:10 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16490C03C1AD
        for <linux-omap@vger.kernel.org>; Tue, 28 Apr 2020 13:34:10 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id m9so9231980uaq.12
        for <linux-omap@vger.kernel.org>; Tue, 28 Apr 2020 13:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=verdurent-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z97Q8zIF1xZ1WiB5BLHXUrpSO7gV7Uk5iXCchLoct18=;
        b=g7o6v59iRNgpmNU22S7QAHVZZ5eMbcXUaro17i5cvT7gtb4rYzeT5iF82Z8QbSyLos
         3oyXlsKo3ccwL58lV4OcDoj5R2Qn/eYUWn62IGSYp5gV3DSeSCJGMksU4PPxXsclN2ui
         cMs1F8RG0iuGsY27CHKe0pK4E5FR+YPotvQ9G+LHh4pczxrc2Gx32+ufbE+9ZLYobY9F
         8bK3rpag9kjCRt4x6AbU1oaoQiyG9svN3c/8pGjp5mRAdBUfTeFHVYSfWap8vG6SWE8j
         A8wHuddtQs6fvQyFQTm0sMt8ovIPXHXjC6ORldqbOU9C8r9F/dRR+sU23tqz6vk9FmKF
         jXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z97Q8zIF1xZ1WiB5BLHXUrpSO7gV7Uk5iXCchLoct18=;
        b=rAz29SYZQ+qs/IYL1euWq7NYgILSm7pP7zOGZlG0piKGPT37qC+sG/S3UfRXPLRWe2
         9y3RxwuqmwrKqFwzAwEy7u9qFjQAboVHyGfLS1hBbxn0mC8+0zIVCfi7CRxnTW6qvB53
         mrOeKuWa6WVJ2Vo/tJ5nJbz+/DOQkjApBnafW0f+Z89oLNCUe2TCJzQx92H8wfP7+jno
         x3T0GCu/x8b7jmGy/TTujdd1tBEMRXSzVNAJYlDg23xBIKqZWGUN+b61IRatchI3Hcop
         GSeqhrFzCcBvt0Go6g7LQ5zKeuAyml0gs0G+37tLOfWzbMClP1m1MQbl8tMvoyd8eETe
         gPrA==
X-Gm-Message-State: AGi0PubPvk8UapDbOiTdFUtyHO9Pe344hgTAzKg2Maakvnn3JCR37FyF
        o5YLrp3DQ6G/1aqDWTMSxjd8UBRY/SbwVis+OqaJ6rR1
X-Google-Smtp-Source: APiQypIreH+1VhDbJwXHZbOxs7FxoAr4YVLrwqIHB4Ov/kDaB/n1zXGWYYQvnW5yvPxXNWy4O5Ee+qC4VU8WGKGBUKU=
X-Received: by 2002:a67:e9d9:: with SMTP id q25mr22060001vso.27.1588106049108;
 Tue, 28 Apr 2020 13:34:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200424161944.6044-1-sudipm.mukherjee@gmail.com>
In-Reply-To: <20200424161944.6044-1-sudipm.mukherjee@gmail.com>
From:   Amit Kucheria <amit.kucheria@verdurent.com>
Date:   Wed, 29 Apr 2020 02:03:33 +0530
Message-ID: <CAHLCerPm=FssMWhccXbJiCaxakDb-Trz_uOpCAmtwEyaQkeqxQ@mail.gmail.com>
Subject: Re: [PATCH v2] thermal: ti-soc-thermal: avoid dereferencing ERR_PTR
To:     Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc:     Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Apr 24, 2020 at 9:49 PM Sudip Mukherjee
<sudipm.mukherjee@gmail.com> wrote:
>
> On error the function ti_bandgap_get_sensor_data() returns the error
> code in ERR_PTR() but we only checked if the return value is NULL or
> not. And, so we can dereference an error code inside ERR_PTR.
> While at it, convert a check to IS_ERR_OR_NULL.
>
> Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>

> ---
>  drivers/thermal/ti-soc-thermal/ti-thermal-common.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c b/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
> index d3e959d01606..85776db4bf34 100644
> --- a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
> +++ b/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
> @@ -169,7 +169,7 @@ int ti_thermal_expose_sensor(struct ti_bandgap *bgp, int id,
>
>         data = ti_bandgap_get_sensor_data(bgp, id);
>
> -       if (!data || IS_ERR(data))
> +       if (!IS_ERR_OR_NULL(data))
>                 data = ti_thermal_build_data(bgp, id);
>
>         if (!data)
> @@ -196,7 +196,7 @@ int ti_thermal_remove_sensor(struct ti_bandgap *bgp, int id)
>
>         data = ti_bandgap_get_sensor_data(bgp, id);
>
> -       if (data && data->ti_thermal) {
> +       if (!IS_ERR_OR_NULL(data) && data->ti_thermal) {
>                 if (data->our_zone)
>                         thermal_zone_device_unregister(data->ti_thermal);
>         }
> @@ -262,7 +262,7 @@ int ti_thermal_unregister_cpu_cooling(struct ti_bandgap *bgp, int id)
>
>         data = ti_bandgap_get_sensor_data(bgp, id);
>
> -       if (data) {
> +       if (!IS_ERR_OR_NULL(data)) {
>                 cpufreq_cooling_unregister(data->cool_dev);
>                 if (data->policy)
>                         cpufreq_cpu_put(data->policy);
> --
> 2.11.0
>
