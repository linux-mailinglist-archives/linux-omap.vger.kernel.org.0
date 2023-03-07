Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30C056ADB14
	for <lists+linux-omap@lfdr.de>; Tue,  7 Mar 2023 10:54:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231163AbjCGJyM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Mar 2023 04:54:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230462AbjCGJxx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 7 Mar 2023 04:53:53 -0500
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D4AF40EF
        for <linux-omap@vger.kernel.org>; Tue,  7 Mar 2023 01:53:48 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-536bbe5f888so234902607b3.8
        for <linux-omap@vger.kernel.org>; Tue, 07 Mar 2023 01:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1678182827;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KJzG0p0gXsmorAUxLydHRSvfZbmyGBAct3SdikU1lvg=;
        b=ezdgd3huiqHpYWOPv12drRgxOHsRQ74szi2bJDNu6gqeI/yULxy73v3t5xP2M5pWG/
         sFQXL+NkSba8OV5hSZyH2eZSwZP+74x/9lQplPTi9bc/8iPXtHvFRvTRnmxAObjyClht
         BupUI5HokaepBOq1Jnoqzn1vOPVQ5+1W5bd4vIRcRkxIqMyPV+CTzt8Rxs2PYjlEyGtW
         3AIdO3GqXUeEh/IA6ZzX5sYwNHsc8EcEd1pwkH0eF12wV9rc+Nh9e1PkewfOm1ONZjVB
         UY183dSOygdZMPENTV46qdG2q3NKArgTxepXLcSIwrqcozyXmDZyYcLm109LkwnGTvm1
         jw8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678182827;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJzG0p0gXsmorAUxLydHRSvfZbmyGBAct3SdikU1lvg=;
        b=yg4k7J7M51yv07aRYwbad0exTFg68jIuje6/iVJwD4gC2a+ldOOCtXkTrXKjvttqmW
         uy5e/5Ukpc3NRRDlAydggAQ3IEu7RWKPzvH5lONnA76CXQRupeuQCcqZsUxH3rnVsF9Q
         VkFYOpPRrj+RFDhP+rnidhNpSfTqBkpbJydbT/QeutECLzTdPFk3j+lDcpoUvSbg2fS3
         cEje3Nd5o6tR5ukKM8jvP5JsPas+oDkAIeXZw7/FnZBo2vaX4QdOnn8aImh13/ycTIXS
         dK7RLZjlAs709mFD/ocf5fjc2dRsEm9bKpI5E6JAjggww6mmnoWGrbJFzNrVtuAm1hcX
         yQOA==
X-Gm-Message-State: AO0yUKX/5WH+f1ff+tQgyHAIrfu6c5wgskqUBoP9mLD462iDPqKF7GZ7
        Ta5lElqU71XAQEhpcPtk3VGP9v/GYtmVvpnPOrI=
X-Google-Smtp-Source: AK7set8L3VPByxziSpBK4EbTyixVSBgK/wG8CRLe9KdDajrtGu44cVZoliI8FLdTM7wpOgxC97OssISwlZI3oauFScM=
X-Received: by 2002:a81:ad44:0:b0:52a:92e9:27c1 with SMTP id
 l4-20020a81ad44000000b0052a92e927c1mr8918117ywk.10.1678182827587; Tue, 07 Mar
 2023 01:53:47 -0800 (PST)
MIME-Version: 1.0
References: <CAGm1_kuc0T5xqdQU0JVbetz+pMZb2=v=jhpgmfvZQhAiPdAG=A@mail.gmail.com>
 <20230306074200.GD7501@atomide.com>
In-Reply-To: <20230306074200.GD7501@atomide.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Tue, 7 Mar 2023 10:53:36 +0100
Message-ID: <CAGm1_ktJH21qk=eRH_xJgwkf_pGCgp1z7Jrp5M2orZ-eNRNg=Q@mail.gmail.com>
Subject: Re: am335x: performnce issues with FTDI and LOW_LATENCY
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>, Bin Liu <b-liu@ti.com>,
        Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Mar 6, 2023 at 8:42 AM Tony Lindgren <tony@atomide.com> wrote:
>
> * Yegor Yefremov <yegorslists@googlemail.com> [230228 08:01]:
> > Any idea why the performance drop is so big?
>
> Maybe lots of interrupts and dma not being used for musb in this case?

Using "irqtop -d 1", I get the following results:

3.18.1 LATENCY_OFF (16 ports): ca. 1000 IRQs/s INTC 17 47400000.dma-controller
3.18.1 LATENCY_ON (16 ports): ca. 4000 IRQs/s INTC 17 47400000.dma-controller

6.2.1 LATENCY_OFF (16 ports): ca. 300 IRQs/s INTC 17 47400000.dma-controller
6.2.1 LATENCY_ON (16 ports): ca. 1000 IRQs/s INTC 17 47400000.dma-controller

#zcat /proc/config.gz | grep CPP
CONFIG_USB_TI_CPPI41_DMA=y
CONFIG_TI_CPPI41=y

Looks like 3.18.1 can handle more interrupts than 6.2.1.

Yegor
