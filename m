Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDDA91B5DD6
	for <lists+linux-omap@lfdr.de>; Thu, 23 Apr 2020 16:31:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728220AbgDWObo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Apr 2020 10:31:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727921AbgDWObg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Thu, 23 Apr 2020 10:31:36 -0400
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6719AC08ED7D
        for <linux-omap@vger.kernel.org>; Thu, 23 Apr 2020 07:31:35 -0700 (PDT)
Received: by mail-ua1-x943.google.com with SMTP id u12so5843138uau.10
        for <linux-omap@vger.kernel.org>; Thu, 23 Apr 2020 07:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=verdurent-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W6zpFn1zJVrYQizk9f7+ghPBLR7OHw9eoL9Fn3H2lbA=;
        b=dJcp7coCzFdfdbkaEsBKqU3CIF7bXl3qmif1RGgpbk4rfIPYRnaH3M4coOmrH7v7tz
         vZY+9NQ+38MKGaIAbfDmJsvL//NhG0o1svW52qxQH68xocUvRdHcgSEu1xmzT1MctZ8Y
         z7bjlvCQR6sCr+JkorL0wNtOzOl1lTedp+fyRGvhz3QrDZg154Ou814jLRD6eNDXMUKu
         lDQg9w218VNTx8ipNLtlfudR7TGhq+LkQw9eyvZmqkrfyw+QaeB962JUVEbTOTgD3Ino
         5XmrW7tUjUz7cbbIE3IkG9z6NAZbtVP9IWy1IiRiSUeTzNZqS8256q8OD8wT6Zqp3s/J
         g6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W6zpFn1zJVrYQizk9f7+ghPBLR7OHw9eoL9Fn3H2lbA=;
        b=ddGfB+3JlwAdOlJj6Wx+2bJ7ah1VLbQx/lr0HW9d1K1ju77Cvcv1UdctgZOlkcy7aj
         RzcPfYvXSSzDs1JBfHeJDhNYSjgocndzz1ZGvWbM8kQ9K2FHU1j4y/eW86PeuxRTbfx5
         lrb0hWnKAzn/HV9Evp55QbkVJzjelpYZ7Sid7bgLSemuG5f1jCBHTFVs9wDs4XTb3xGe
         bSUE7GjgsiMK2CHp3AC8q/aVLP721Dk8+oQMuZ9ULXsnNHqus7PSJbUOiLroQc7OcYjW
         CVSTrkxz9OWO68uWLvPEhHJrqIThlib5fANBdUfN5YTJR2OKMh0RQWL5MICsl4TusnIo
         aN+g==
X-Gm-Message-State: AGi0PuY3kk3Tkb7UrzPvQbALZWbb/npc1IjKQ96fq732Mdst+vrs/LWx
        WJe1Dkpf4AriML17Hc7islhMiec7S5ezDHNhEKNeQg==
X-Google-Smtp-Source: APiQypLj7+UHWWr7l19cHjaedxQUwCnANkyx2Oxglcx9VhHQg+KFxhHNZ0hR6id8hEFLijzaPhwicBS2Wc3omEh9rnY=
X-Received: by 2002:a67:4242:: with SMTP id p63mr3000372vsa.159.1587652294393;
 Thu, 23 Apr 2020 07:31:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200423125757.14057-1-sudipm.mukherjee@gmail.com>
In-Reply-To: <20200423125757.14057-1-sudipm.mukherjee@gmail.com>
From:   Amit Kucheria <amit.kucheria@verdurent.com>
Date:   Thu, 23 Apr 2020 20:01:10 +0530
Message-ID: <CAHLCerOTruxM_nJHVhjqq--gczi_MQRWGQN2zKF_BXpaz02ovw@mail.gmail.com>
Subject: Re: [PATCH] thermal: ti-soc-thermal: avoid dereferencing ERR_PTR
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

On Thu, Apr 23, 2020 at 6:27 PM Sudip Mukherjee
<sudipm.mukherjee@gmail.com> wrote:
>
> On error the function ti_bandgap_get_sensor_data() returns the error
> code in ERR_PTR() but we only checked if the return value is NULL or
> not. And, so we can dereference a error code inside ERR_PTR.

Typo, s/a error/an error/

I see other uses of ti_bandgap_set_sensor_data() in the same file that
could use similar checks.

e.g. ti_thermal_unregister_cpu_cooling, possibly
ti_thermal_report_sensor_temperature?

>
> Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>


> ---
>  drivers/thermal/ti-soc-thermal/ti-thermal-common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c b/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
> index d3e959d01606..1e2bf1f22dd1 100644
> --- a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
> +++ b/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
> @@ -196,7 +196,7 @@ int ti_thermal_remove_sensor(struct ti_bandgap *bgp, int id)
>
>         data = ti_bandgap_get_sensor_data(bgp, id);
>
> -       if (data && data->ti_thermal) {
> +       if (!IS_ERR_OR_NULL(data) && data->ti_thermal) {
>                 if (data->our_zone)
>                         thermal_zone_device_unregister(data->ti_thermal);
>         }
> --
> 2.11.0
>
