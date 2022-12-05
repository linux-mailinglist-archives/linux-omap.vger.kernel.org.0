Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2CEA6437D7
	for <lists+linux-omap@lfdr.de>; Mon,  5 Dec 2022 23:16:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233501AbiLEWQQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Dec 2022 17:16:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233456AbiLEWQN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Dec 2022 17:16:13 -0500
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71E0018352;
        Mon,  5 Dec 2022 14:16:12 -0800 (PST)
Received: by mail-oi1-f175.google.com with SMTP id q83so1217326oif.7;
        Mon, 05 Dec 2022 14:16:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kMRgrsQtBlz0aFGl+XWWNhjtYbMdMZHefbehXBHITiA=;
        b=fyVgJ/uktb/3IlTjE9zWKOby2pzdLq3tJ2Dvo80xufVc/NltgE2YIOFjvFzN0lIDBn
         UOTHcOt8SJijMBdqwxwDmjnrXq6q3dvrUg62VnXPAvnGm20wCLtSvJTBPCn6ZL4zDU3X
         Hq8HkvdPGirS7dTWswgw7ATKgdX0tE/UcuHe5hEG3VA+7X7VFnWbl6pRnol/rJ7a4QMA
         ZLXaj0DzILCZRnts3Bu6JfvSSYOddnYDFJhmHLR8SrGZnqUg83Gwxtwcd7a84eKN9Yrq
         htWRvrgD7IIPtbXstibf5aXwn6kpaBIwcUNjOrTu/ecqJwY9HSH2jX18YgDkbK9gMEBr
         TeSA==
X-Gm-Message-State: ANoB5plmJ5hSvI5+NOs7i/9jt4BLOgGlonKCPA66oN971mSUt3xiUYmK
        G0HIdIHMphKFPIpho19HA1JIRFRunA==
X-Google-Smtp-Source: AA0mqf7WQ23Rw0/ZAjjpv/OrOKzY+SFzKupTmnpiS0PmyscURhAxWkwYUHgJLKEtUBm8pLuQOvXUPA==
X-Received: by 2002:a05:6808:18a7:b0:35a:58c7:7f58 with SMTP id bi39-20020a05680818a700b0035a58c77f58mr32572107oib.20.1670278571498;
        Mon, 05 Dec 2022 14:16:11 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v18-20020a544492000000b00354932bae03sm2008427oiv.10.2022.12.05.14.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 14:16:11 -0800 (PST)
Received: (nullmailer pid 2785281 invoked by uid 1000);
        Mon, 05 Dec 2022 22:16:10 -0000
Date:   Mon, 5 Dec 2022 16:16:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Carl Philipp Klemm <philipp@uvos.xyz>
Cc:     linux-omap@vger.kernel.org, tony@atomide.com, sre@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] arch: arm: dts: cpcap-mapphone: Move cpcap leds from
 common dts file to devices as apropriate
Message-ID: <20221205221610.GA2778910-robh@kernel.org>
References: <20221204104313.17478-1-philipp@uvos.xyz>
 <20221204104313.17478-4-philipp@uvos.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221204104313.17478-4-philipp@uvos.xyz>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, Dec 04, 2022 at 11:43:13AM +0100, Carl Philipp Klemm wrote:
> Removes non-functional leds from xt875 and adds its touchscreen
> button light
> 
> Signed-off-by: Carl Philipp Klemm <philipp@uvos.xyz>
> ---
>  .../arm/boot/dts/motorola-cpcap-mapphone.dtsi | 47 ++++++++-----------
>  .../arm/boot/dts/omap4-droid-bionic-xt875.dts |  7 +++
>  arch/arm/boot/dts/omap4-droid4-xt894.dts      | 14 ++++++
>  3 files changed, 41 insertions(+), 27 deletions(-)

Looks like you are breaking the ABI with this series. What happens in a 
system with only the DT change or only the kernel change?

Rob
