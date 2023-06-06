Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDD647236C9
	for <lists+linux-omap@lfdr.de>; Tue,  6 Jun 2023 07:26:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbjFFF0e (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 6 Jun 2023 01:26:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232252AbjFFF0a (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 6 Jun 2023 01:26:30 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A74E19C
        for <linux-omap@vger.kernel.org>; Mon,  5 Jun 2023 22:26:27 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f7ebb2b82cso698925e9.2
        for <linux-omap@vger.kernel.org>; Mon, 05 Jun 2023 22:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686029186; x=1688621186;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dDsCLYgxw0cAllMIv7aPZnktih/2jRXLUmlxWaBI1IA=;
        b=IwxvokNMCgzhhXOUSzqxqBgRxmi+htg/TlgMk4ZYeM32beHp0ygBO8euxAR0AQm+1o
         c41sqH0a03Ang8oPH4q5RE2TIZ7EzDBicWi5Upqo1LS+VH8cHLDoXkXA27jwp8wo48rf
         eZmiyl/UL9g3tnTKk1UqirKGm7+TsJwBv75CZSJH9zuV9IOtgE6Ar+SpSBJxi9gqZ6mz
         BpNyY5nVfJPTkaELNR9yt+4F16iw3qCLjesDjgrzXMwNg4ryEavCgFDHvFNOiEnpPwU9
         qlbDzpvSAdN661d7mnDQUfmS53+gK8Qv4j+Yvm6y3AX2CWfAiZFODcAcPaKId8yVzZ1t
         9Olg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686029186; x=1688621186;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dDsCLYgxw0cAllMIv7aPZnktih/2jRXLUmlxWaBI1IA=;
        b=Y3gLkicUDv94MiCOsPwNoeaaYopZFtmNcWS8M2V+WiApoTNDskvvx2V/Zd9KnJBhCE
         ikwo/mU+o11ZzlOyIJFu5rZq2ElL7Msit28Uj1i5mJmz2b/9/xc23lJbvEmBwnaSkWqI
         BKR6mqFU8PB/ylXZUSryf2TJS93RcnCvs1xb88L6RvPC4xMrZ235bPsNPOCEUpWoNhFm
         acMNVZMcYy7DTe3jJCIO0t3wXOokxGSfuwLqgSnpjCgUoH1fiMSaI/BsRJW3R4jku+74
         7ZNUz4VNdBoe1Ep5CoI0uO5adXCQLxegU2vCjwzBu75UR0e9tJkaEGK2gTBPO3H1TLvK
         QM7A==
X-Gm-Message-State: AC+VfDwG+cnlj17wXP7Be23uE7ssyoxqCPIR4ZtvEtla7aCXOWRMsdTL
        IBXxAuUPLBzcLZXT6Sbekw1K5w==
X-Google-Smtp-Source: ACHHUZ7O2HWP67RgSNqCAyjbTAYsyzDWwhj4EAisp0m7UY5KYbL/2OK6vhedUYAPw7jtmm/0lF9awg==
X-Received: by 2002:a7b:cc8e:0:b0:3f6:766:f76f with SMTP id p14-20020a7bcc8e000000b003f60766f76fmr979213wma.36.1686029185900;
        Mon, 05 Jun 2023 22:26:25 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f18-20020a1cc912000000b003f4e3ed98ffsm12686196wmb.35.2023.06.05.22.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 22:26:23 -0700 (PDT)
Date:   Tue, 6 Jun 2023 08:26:19 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org,
        deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH 11/30] fbdev/ep93xx-fb: Do not assign to struct
 fb_info.dev
Message-ID: <dbff5ba5-f34f-41d3-b8d5-2bfb7d34df5b@kadam.mountain>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-12-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605144812.15241-12-tzimmermann@suse.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Jun 05, 2023 at 04:47:53PM +0200, Thomas Zimmermann wrote:
> Do not assing the Linux device to struct fb_info.dev. The call to
> register_framebuffer() initializes the field to the fbdev device.
> Drivers should not override its value.
> 
> Fixes a bug where the driver incorrectly decreases the hardware
> device's reference counter and leaks the fbdev device.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Fixes: 88017bda96a5 ("ep93xx video driver")

regards,
dan carpenter

