Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADB30223B83
	for <lists+linux-omap@lfdr.de>; Fri, 17 Jul 2020 14:40:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbgGQMkx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Jul 2020 08:40:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726233AbgGQMkw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 17 Jul 2020 08:40:52 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A787AC061755
        for <linux-omap@vger.kernel.org>; Fri, 17 Jul 2020 05:40:52 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id f7so10933798wrw.1
        for <linux-omap@vger.kernel.org>; Fri, 17 Jul 2020 05:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XbMlCx11rbLbFdkC+QXH5CyvBU1jlgOnuYV3o/eKSTc=;
        b=OBBIeRs5YQe53cyRJeYX75WESLa9u6jWsQw6BHANNlhLz0wf2n0wBzj8MgP2EsOMiK
         RO5iEVLGGOhPrAOHX33imdi5OOVvLr3NXI8sUJu/PKYPLN0fzQLprMhMBE97OXa6RbbU
         6+WvAVfC8dKi9MAg/7CkoXVRbIJW9gEK/HsTo7JPOKp+zyeDAkFRAG7Bm9QqzxFPgqC9
         OegEwqPAbUsJ2tD00KAsM8F1iLa0gyTn28EQ1jrpcWa6vM/uPmYMBjdJTQoML6uCAp1L
         nk+19uoCTuoX+65yEHNt0v7HDaghNLgg+VD3+bEX1rCBhz+hg5r/p4QjFI6gEtaLMBGI
         aKyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XbMlCx11rbLbFdkC+QXH5CyvBU1jlgOnuYV3o/eKSTc=;
        b=rj/dzKc912pL4iqWDS90KuXJsoqRHWk1ltwHGRLsVYSn430b3VDASlb0QDyvOEPIiZ
         QzDkxtQwICyQEXOEtGQUHaYLWvu6R02VzVPq6AbaWyBshy2wDt3WjgTaczAVcZde9NXE
         W+gwJynijXKZc9iozm4Ej1pfBBXeUjfggu1xZcauRS16F230c2OBpbS82BA2cQp4oHbH
         hlGR/VinBTw3qYnfEZqCMcBcSABdlZcyUQgk7nxvIVOpTIr9BFes1PPH+hqaGu0AeNSH
         0Z/3KSfEpu2KDE7XRtlboBj0hAhmBQ3mBkBrtZf+Iv1eh993gqnIIBht74P3pdxY+eO2
         GX1g==
X-Gm-Message-State: AOAM5305Hjd8btnR4Y0Sf1pI48qEx3Q1yM4rovPUt3QqvzdHKd1P2FtC
        EfJhbcawqJrUhY13F6T4dwcZ4A==
X-Google-Smtp-Source: ABdhPJyF/BzNPUDFp+tDFXgMK1ultZ/7J033uKll5RZ3+R6Ql7SrsDuTaWrGbG2627gogx/ISCkf7w==
X-Received: by 2002:a5d:4d49:: with SMTP id a9mr1589896wru.312.1594989651376;
        Fri, 17 Jul 2020 05:40:51 -0700 (PDT)
Received: from x1 (220.red-95-125-197.staticip.rima-tde.net. [95.125.197.220])
        by smtp.gmail.com with ESMTPSA id k126sm15137861wme.17.2020.07.17.05.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 05:40:50 -0700 (PDT)
Date:   Fri, 17 Jul 2020 14:40:48 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: Re: [PATCH v2] gpio: omap: handle pin config bias flags
Message-ID: <20200717124048.GA1765226@x1>
References: <20200715213738.1640030-1-drew@beagleboard.org>
 <CACRpkdZ+Bm4MsyaJJ89q7_KfgmyQWyJ57SC3F38gxTbsOfwNTA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZ+Bm4MsyaJJ89q7_KfgmyQWyJ57SC3F38gxTbsOfwNTA@mail.gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Jul 16, 2020 at 10:29:30AM +0200, Linus Walleij wrote:
> On Wed, Jul 15, 2020 at 11:37 PM Drew Fustini <drew@beagleboard.org> wrote:
> 
> > Modify omap_gpio_set_config() to handle pin config bias flags by calling
> > gpiochip_generic_config().
> >
> > The pin group for the gpio line must have the corresponding pinconf
> > properties:
> >
> > PIN_CONFIG_BIAS_PULL_UP requires "pinctrl-single,bias-pullup"
> > PIN_CONFIG_BIAS_PULL_DOWN requires "pinctrl-single,bias-pulldown"
> >
> > This is necessary for pcs_pinconf_set() to find the requested bias
> > parameter in the PIN_MAP_TYPE_CONFIGS_GROUP pinctrl map.
> >
> > Acked-by: Grygorii Strashko <grygorii.strashko@ti.com>
> > Acked-by: Tony Lindgren <tony@atomide.com>
> > Signed-off-by: Drew Fustini <drew@beagleboard.org>
> 
> This v2 version applied!
> 
> Yours,
> Linus Walleij

Thanks! 

I'm curious which branch should I look in to find it?

I didn't see it in any of the branches in:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/refs/

-Drew
