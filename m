Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFFA57262E8
	for <lists+linux-omap@lfdr.de>; Wed,  7 Jun 2023 16:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234667AbjFGOf7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Jun 2023 10:35:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241075AbjFGOf5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Jun 2023 10:35:57 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D6851BEA
        for <linux-omap@vger.kernel.org>; Wed,  7 Jun 2023 07:35:55 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f6da07feb2so73430855e9.0
        for <linux-omap@vger.kernel.org>; Wed, 07 Jun 2023 07:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686148554; x=1688740554;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=deFx223UAn6/3WPT3CB+BedQKRrIofGGQo7Oraihby4=;
        b=mYOEVqMXw3Q8wvGV5v2RZzRwA+4Mqjcm8fYX68tNivJRV3fglrj3h0DcBeYSamGejq
         ULZmGnjzhGkRqyROnr3h3tUWSqfdhmrlodjnU5PurkxosQcs+9Xs/B1kOCDfCBPwM0ob
         cwEGiwsDqLFApd9QD8kVF2hvKBgPSnUvGRf3MrHJ5QV7vsExHJgJBotMyJKJ6RdIB6gO
         97kw7YXhqniAjmMT9Pc8L5iL67j7UhaRR4Wq4AQB7V/EFovLVM7zr1ZuWRPA3cUZfXai
         PZP2NmBhNI8YcR4+lgb8NImAo1g17jDE+RSoPWX+j/fPBsVch9FNgb12N89oTBmtUM3l
         hWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686148554; x=1688740554;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=deFx223UAn6/3WPT3CB+BedQKRrIofGGQo7Oraihby4=;
        b=Xq7VWAIravf2eV7QeSkGQE0RNVK6JnGTGtWzrRS/N+5p4UMRdCGkygrtylhfwHwKNP
         NdRVmB0SHQQ496T47dcFBq8bNCcG+/lHbtoGMdGVw7PSh2lQWrTp8GfuEFkuuIaC8hTa
         nNgDqbo84qqPLJIX+utYE1yscdPhUGGIpxwy+t0uxQoe/0rn67E7SfjwlaEgAb9mLBxo
         eY7+yOP26UeFNDJG9n6IrgkhJe4oBMwUFEVx8NSP0MZYlvFwyWlg/k/HrTy4NkuEo1/h
         2KVCfuHA8oeFJceAYaAaHCluVC6NthbBSdFIfA6QyxpD3OS2+u52MUxaPz8d+VTgiGR0
         rO8w==
X-Gm-Message-State: AC+VfDxrC98TK1dPjSTp/CH57p6nXgsNVDH7hGTKz+a+aNrs5YgYH2qt
        JewtpF7/brce8ev7odSDX1hrfmDhFcUBzugtfzq+Yg==
X-Google-Smtp-Source: ACHHUZ6rr+HgEVIoVLyykSTfTB2HiarNlmmYZrEKCS2/KijlnRwxvv+5UXoQuaCyA+JqF/Hdo4PK9o4GyOi/AVPIoAk=
X-Received: by 2002:a7b:cc93:0:b0:3f6:af2:8471 with SMTP id
 p19-20020a7bcc93000000b003f60af28471mr4912522wma.26.1686148553863; Wed, 07
 Jun 2023 07:35:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230601105904.3204260-1-danishanwar@ti.com> <ZH4aywQoA9gy2OWU@p14s>
 <20230605204552.x4ctuzos4rysldwj@sessions>
In-Reply-To: <20230605204552.x4ctuzos4rysldwj@sessions>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Wed, 7 Jun 2023 08:35:43 -0600
Message-ID: <CANLsYkyOhtaWbgKX9kkkLUtMkZbAp5t+JA7BNYULXf9r_FmNNw@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: pru: add support for configuring GPMUX based
 on client setup
To:     Nishanth Menon <nm@ti.com>
Cc:     MD Danish Anwar <danishanwar@ti.com>,
        Bjorn Andersson <andersson@kernel.org>, rogerq@kernel.org,
        vigneshr@ti.org, srk@ti.com, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, 5 Jun 2023 at 14:45, Nishanth Menon <nm@ti.com> wrote:
>
> On 11:26-20230605, Mathieu Poirier wrote:
> [...]
> > Here I have to suppose pruss_cfg_get_gpmux() has been added to Nishanth's tree.
> > As such the only way for me to apply your patch is if Nishanth sends me a pull
> > request for the patchset that introduced pruss_cfg_get_gpmux().  You can also
> > resend this in the next cycle.
>
> Yes, I had pulled this in [1] along with a few other driver fixes. I
> can send you an immutable tag to pull for your tree, if that helps the
> process along though, it might have a unrelated driver fixup patch as
> part of the series though..
>

MD has indicated he would rework his patch and send a new revision in
the next cycle.

> [1] https://lore.kernel.org/all/168434617580.1538524.11482827517408254591.b4-ty@ti.com/
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git/log/?h=ti-drivers-soc-next
> --
> Regards,
> Nishanth Menon
> Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
