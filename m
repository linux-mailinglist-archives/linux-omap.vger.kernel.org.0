Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C493B5FB0A5
	for <lists+linux-omap@lfdr.de>; Tue, 11 Oct 2022 12:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbiJKKoY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 11 Oct 2022 06:44:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbiJKKoX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 11 Oct 2022 06:44:23 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98EB08C039;
        Tue, 11 Oct 2022 03:44:20 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id t4so8326038wmj.5;
        Tue, 11 Oct 2022 03:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QAciK97rt6oCnZL2z3e7Ty/+ML2bZUrUvtiPEGHd6rE=;
        b=aTXCkzCKfFNb9TavJAorvhjcNcIn6HAYkqR4K0JI6vM5TJUm25MPXUcS7OWeKyhHhd
         Mvyxqv7q8mDn3IHQm9sQlebV5hI/9YxpqfSeg/Un/kBH8NG4FEiUB0mcyY/JCKSQMsjD
         3T12kb3itiWuJk/FjGUXpw53AKvWLBMEHqeq6Yan+2ovPEFv8BvjIu1KMgyN0bPKHaxs
         CxYMEUINP1Co1sYD6umCc96nirjoX91bEWaMtvN739MHsWhgtnctnOkDhdBU/oWhfBHK
         0XO9e9kU+41ijSosETaUjcTIcOSIMJ5Tmo2qnf2/etbUlnMUtc6viENmGZvODslUMusn
         Uhsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QAciK97rt6oCnZL2z3e7Ty/+ML2bZUrUvtiPEGHd6rE=;
        b=tLqnUT3Lv5jagDfmG2EaAfQ5qZLmYAsIO/BXEcYDmpXdx8X4/EJPxgKOKP+DU/KInC
         dYiiDT0wogPWe9CWAKyXjCG6ngeqo0xhtOvSPqBwFQrRhbTFLqOvUKWO1hSpIR0cWrfB
         MVjmHtFUFuZgEM1USVqMpk7fcIPKZHXKqdpto1yPJG0HCTaWat80bMvjPjXO1JmuUqxC
         7kpcOt6v/hVuGGXXWmA4qf6avPZAMjGgnWec5yOgnCSZeJG0S6stA9xyVU1gahqeBjYC
         7OfWT1miqojjD2jfo4IwF2fcY/wPoyVg/hpmLkELADhC2xfaVy/DLx86QqTzRZtBCENI
         d0Vw==
X-Gm-Message-State: ACrzQf2iQ/MDQt4Zv4y6I23PIBzKrObXy9PUFnTiPQiaDgIYEmIZh/IN
        0jYV5C/N0s3eJW1C2AB4Kbo=
X-Google-Smtp-Source: AMsMyM4YGBzDEa/LxEz2jOVlhmvF5plZCSfFgUk1WZyAHi6DxH6YCLTRZzfSM3hvW4sn1dkScEiM9A==
X-Received: by 2002:a05:600c:414b:b0:3b4:a655:720f with SMTP id h11-20020a05600c414b00b003b4a655720fmr22186501wmm.92.1665485058831;
        Tue, 11 Oct 2022 03:44:18 -0700 (PDT)
Received: from tp440p.steeds.sam ([41.215.150.62])
        by smtp.gmail.com with ESMTPSA id u11-20020a5d6acb000000b0022afedf3c87sm11055624wrw.105.2022.10.11.03.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 03:44:18 -0700 (PDT)
Date:   Tue, 11 Oct 2022 12:44:11 +0200
From:   Sicelo <absicsz@gmail.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        maemo-leste@lists.dyne.org, Felipe Balbi <balbi@kernel.org>,
        phone-devel@vger.kernel.org, Bin Liu <b-liu@ti.com>,
        Rob Herring <robh@kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [maemo-leste] USB PHY Initialization Fails on Nokia N900 Since
 5.19
Message-ID: <Y0VI+/XJs8nsazwE@tp440p.steeds.sam>
References: <Y0PhEOl+MwlQ8HAD@tp440p.steeds.sam>
 <Y0UBindrJa1ptyR0@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0UBindrJa1ptyR0@atomide.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Oct 11, 2022 at 08:39:22AM +0300, Tony Lindgren wrote:
> To me it seems that we now somehow have a probe issue for musb depending
> on how it gets probed depending on the following line:
> 
> device_set_of_node_from_dev(&musb->dev, &pdev->dev);
> 
> I think commit 239071064732 ("partially Revert "usb: musb: Set the DT node
> on the child device"") fixed the issue for omap3 that still uses hwmod
> by removing the device_set_of_node_from_dev(). However, it somehow broke
> SoCs using ti-sysc like omap4.
> 
> My guess is commit 239071064732 will fix the issue for you?

Hi Tony

Thanks for the suggestion. However, 239071064732 does not fix it for me.
With that in place, there is no trace created automatically, but dmesg
shows:

  [    1.389648] musb-hdrc musb-hdrc.0.auto: error -ENXIO: IRQ mc not found

I wonder if there is something to update on the N900 dts perhaps, in
connection with the recent musb changes?

Regards

