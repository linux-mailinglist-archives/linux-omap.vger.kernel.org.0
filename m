Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7486945AA10
	for <lists+linux-omap@lfdr.de>; Tue, 23 Nov 2021 18:26:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230359AbhKWR3n (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 Nov 2021 12:29:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233865AbhKWR3m (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 23 Nov 2021 12:29:42 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0DC1C061574
        for <linux-omap@vger.kernel.org>; Tue, 23 Nov 2021 09:26:33 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id n8so17667440plf.4
        for <linux-omap@vger.kernel.org>; Tue, 23 Nov 2021 09:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KPed58hFTpRLwDYqt33WLynTmRa2Y0w9rmJh+0dHScs=;
        b=NsQtJWQHb0i7N75jRXDo1GAfh8tCOwnNO/CY1LBHQ3+k1q+QvHJ8lxNXxFur5/TfxX
         lKMf6ziPucsto3HP6SMT+fkTlcbNPlDtf+o3rmjOWTHFqZSbXSIwSTu4cCYY3sciqQW/
         R7uDNf+91nRyHkASh0xFxgYlen0yUmoYQT8rxaQE/mVEsKDDE2ku7aPAALunA65sPwxg
         CNm651hMUnAEkAoSXU+RlTvItFP/doDb338O5wKv3fkW2xLNkyQgbZvzWBZRqoy3xl0X
         reLXNosQq9q6WY4J50b/HJOcCH5Q6p5wV5OJCvEGjp5dRJuG6eVc6wHSGVdbUDcJmLEq
         07oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KPed58hFTpRLwDYqt33WLynTmRa2Y0w9rmJh+0dHScs=;
        b=JRlisZkSEiaK7EdKn3vRqHkJKD2KFEk0xgvm0OIAwi6C40OlDekYCIipgULdh8njuY
         tnh5zU01HFrR2KYRXSQty32xPumv1uL2eq9H/7svDaxBxLLLm79djGuwj8SmRZ+OOcmV
         6B7bI4DIFKGL6RFwlUHBpCXDqbQWKDIVSXgqk3CgroSCRAaSdDjrThNHsk+DMelg4oIO
         vg+E5tKw7s1667GNphGq39hH0Pv7hz7w00syE6xSEM8YYF6rrIEqqFHo/ppSWxvQ3bYy
         IgCMpzozr+yseXWtcBRJ0x6FwmHWBjTW14ek+3vBpEyl6MSziqb5g7/UBpcZnWjmdjNm
         edSA==
X-Gm-Message-State: AOAM530dsRH8h5OvPM5gSnoKoZ0eSL+RilEELCrXMBEqZr6lUQQx9NBX
        aqA02eGqxh375UomGBbXwHRCheA0NHPy1YIFhZXX/dBvJfYGZg==
X-Google-Smtp-Source: ABdhPJw2jpYc2Lwn/EShV3vG24WLglTCIqgSsDmx5UNLkhvp9W8mUJfbLxP8eGkFhr9vraOm6G/vBX3gZPAZn9uZNGI=
X-Received: by 2002:a17:90b:4a05:: with SMTP id kk5mr4925971pjb.142.1637688393387;
 Tue, 23 Nov 2021 09:26:33 -0800 (PST)
MIME-Version: 1.0
References: <20210921071807.30978-1-narmstrong@baylibre.com>
 <20210921071807.30978-2-narmstrong@baylibre.com> <YV1UdSVOrZ3B9pq/@atomide.com>
 <CAMSo37UN78k=WE0CwRyNNV3P9kau+JzVZ7mHOMMvh5Bn=+=jAQ@mail.gmail.com> <78b51650-0e32-e81f-0191-2222580e7343@baylibre.com>
In-Reply-To: <78b51650-0e32-e81f-0191-2222580e7343@baylibre.com>
From:   Yongqin Liu <yongqin.liu@linaro.org>
Date:   Wed, 24 Nov 2021 01:26:21 +0800
Message-ID: <CAMSo37X1BA1cYYxwjWBo_dhjpGYuYD2KK00+3ZWAwNeJq8UfxQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] ARM: dts: dra7: add entry for bb2d module
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gowtham Tammana <g-tammana@ti.com>, Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi, Neil

On Tue, 23 Nov 2021 at 20:47, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi,
>
> On 23/11/2021 13:17, Yongqin Liu wrote:
> > Hi, Neil, Tony
> >
> > # sorry for the confusion if you have received the mail which I sent
> > before, which is not in plain text mode.
> >
> > We have one out of tree change to enable the SGX544 gpu for the
> > beagleboard-X15 Android build,
> >     https://android-review.linaro.org/c/kernel/common/+/20521/11/arch/arm/boot/dts/dra7.dtsi
> >
> > and that seems to conflict with this BB2D enabling change,
> > Could you please help give some suggestions on how we should update our patch
> > to make it work with BB2D, without the revert of this change?
>
> This BB2D patch alters the target-module@59000000 while your SGX
> change alters the target-module@56000000.
>
> Please rebase your patches.
I am sorry if the "conflict" I used previously caused the confusion.
What I meant with the "conflict" word is the feature conflict, not the
patch merge conflict.

I could merge my SGX change with the BB2D change there, but then my
build could not boot successfully to the homescreen,
I need to revert the BB2D change to have it boot to the homescreen successfully.

Here are the serial console output in case you want to check:
https://pastebin.com/RY472b96  work with the BB2D change reverted
https://pastebin.com/aP97r7rJ    does not work with the BB2D change.

Not sure if you have any idea about the problem.
Please help give some suggestions on what I could try.

Thanks,
Yongqin
>
> >
> > On Wed, 6 Oct 2021 at 15:47, Tony Lindgren <tony@atomide.com> wrote:
> >>
> >> * Neil Armstrong <narmstrong@baylibre.com> [210921 10:18]:
> >>> From: Gowtham Tammana <g-tammana@ti.com>
> >>>
> >>> BB2D is a Vivante GC 2D Accelerator.
> >>> This adds the node to the dts file within a target module node.
> >>> Crossbar index number is used for interrupt mapping.
> >>
> >> Thanks applying into omap-for-v5.16/dt.
> >>
> >> Tony
> >
>


-- 
Best Regards,
Yongqin Liu
---------------------------------------------------------------
#mailing list
linaro-android@lists.linaro.org
http://lists.linaro.org/mailman/listinfo/linaro-android
