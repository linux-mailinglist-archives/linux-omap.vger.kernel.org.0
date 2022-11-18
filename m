Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FF8C62F11B
	for <lists+linux-omap@lfdr.de>; Fri, 18 Nov 2022 10:25:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241916AbiKRJZG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Nov 2022 04:25:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241904AbiKRJZD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Nov 2022 04:25:03 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 243C98B134;
        Fri, 18 Nov 2022 01:25:01 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id x102so6385664ede.0;
        Fri, 18 Nov 2022 01:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gKgICWF8PhcN9znHNyScgg7exhppSMJRut09gLPxlMQ=;
        b=FQIa3dsiFvBvdU97Fg7eGSX2sG2sNgpK4QCGmyfvMeVyUvutzKDVwhLCM81l8p4uKT
         YXNkQaS2sulqvzxY6hckmlzZkzXVIKVoF61D6gI/J4EvxpRMq7SS4a1Dfvgejmle7H/9
         HCWZiOh0ppH2fs0Etlxeej3sgko15E6U4j2uN1kTBRo9Z67sLUKz4YRsyXgU7ceLzQ0d
         NBzlVLxTes6sfoUGn5i0TsKRbpLq+v77UKwh2KUTryiHxJ4SHEZDymM3ryYZRwb2GlKh
         6nBSSPn/ks1qb+LY23ZzmT7vWz4hjNVBp+Zz1g1ZIM1pBjrtLyofFuF43MOqp91QZx1y
         hZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gKgICWF8PhcN9znHNyScgg7exhppSMJRut09gLPxlMQ=;
        b=M7M9mpssCIpwr43vmPf2hkf8yhjXi/m7stttcP8fMpK79BSeQk1yb3vinUeG9tkxU1
         xmlCTXVf8HkMPKB9Y4+TndPzPm8xfmzhKegoQNXF3rxwLt7+tvhaQK3QjlZX/RpSXSdR
         7FEv9YbJxtYM8zxARUzatZ7JsU82Itxso5omlGw7Y3RZrg0kXVsay2rPFL2O2QpOaIYU
         tMoToPCCmTaexAmxNe4l/ttEL3/24ZW7L3ZCyib6zJbipfi7yKMJmgssP7QI8G/7npxf
         kWMXjcWcp1ysodqwl+07SX9WXA1/NTJoWyBHinJG45Em9t1EL9ZY2SjbIrnylhq306C7
         awYA==
X-Gm-Message-State: ANoB5pmIgLGp77oqXoQl+nnza7fZWpmMyXcfFZL56e/7s5PHu18kLx+L
        mNyZ2SoSsBUSgEL4bHqRh6A=
X-Google-Smtp-Source: AA0mqf4ssbNwY+RcCatWRtY7/gI0y9cFz37vJ1/2TV3FgHa6PeudOu4ZfQKCC3kiS0w4FQs4vtHP5Q==
X-Received: by 2002:a05:6402:b81:b0:45c:a651:8849 with SMTP id cf1-20020a0564020b8100b0045ca6518849mr5508151edb.209.1668763499578;
        Fri, 18 Nov 2022 01:24:59 -0800 (PST)
Received: from tp440p.steeds.sam ([2602:fbf6:10:8::2])
        by smtp.gmail.com with ESMTPSA id kz22-20020a17090777d600b0078d46aa3b82sm1430954ejc.21.2022.11.18.01.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 01:24:58 -0800 (PST)
Date:   Fri, 18 Nov 2022 11:24:48 +0200
From:   Sicelo <absicsz@gmail.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        maemo-leste@lists.dyne.org, Felipe Balbi <balbi@kernel.org>,
        phone-devel@vger.kernel.org, Bin Liu <b-liu@ti.com>,
        Rob Herring <robh@kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: USB PHY Initialization Fails on Nokia N900 Since 5.19
Message-ID: <Y3dPYEaqVfXFmyYf@tp440p.steeds.sam>
References: <Y0PhEOl+MwlQ8HAD@tp440p.steeds.sam>
 <Y0UBindrJa1ptyR0@atomide.com>
 <Y0VI+/XJs8nsazwE@tp440p.steeds.sam>
 <Y24JkS3tykIZRH+A@tp440p.steeds.sam>
 <Y3c+VSLcH+c2sLGr@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3c+VSLcH+c2sLGr@atomide.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

> OK thanks that helps, I think it's because the platform IRQ resources are
> no longer being automatically populated from devicetree because of the
> issues with deferred probe.
> 
> Maybe give the following patch a try and see if it helps?
> 
> Then assuming this works as a fix I'll post further changes to make also
> omap2430 glue layer to probe with ti-sysc interconnect target module
> driver in call cases.

Hi Tony

Thank you very much. This patch works well on the N900.
 `cat /sys/firmware/devicetree/base/ocp@68000000/usb_otg_hs@480ab000/interrupts`
still returns null, but from your explanation, I guess this is expected.

In case this gets published in its current form, you're free to add:

Tested-By: Sicelo Mhlongo <absicsz@gmail.com>
