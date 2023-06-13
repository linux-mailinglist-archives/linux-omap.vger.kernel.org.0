Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B042A72DFD8
	for <lists+linux-omap@lfdr.de>; Tue, 13 Jun 2023 12:40:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241920AbjFMKke (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 13 Jun 2023 06:40:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241844AbjFMKka (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 13 Jun 2023 06:40:30 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70D2C1AA
        for <linux-omap@vger.kernel.org>; Tue, 13 Jun 2023 03:40:22 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f61b45ee0dso6540730e87.0
        for <linux-omap@vger.kernel.org>; Tue, 13 Jun 2023 03:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686652820; x=1689244820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RdczPZ7i6NweZc4Vs1GEhNBw4P6SDuu4rOPlRce3Cp8=;
        b=AUbPJ07Z1odDHtCnZ823RkphdvcZ3F/p41LyifJZBZRycWLx87uEthbAheLUd9d4fw
         QvGkzgij5648YDEodj6ptRqC3+VUPZMSTPRxfifNBvFk5k/G8mO9kSrJUgsPUDjdDQf2
         kTU3N5IYasoX9y19jal1hK3/EAY3Gdp4ouqToLfnrCAWts9kY7jbGAedRlMQMqFpKqCy
         eb1lJENWNoO1+j3VwToC/V/8Akbn4QHdPdYSHoF7cFV/ajJMbhAiqrkPreFsPsLO2TV4
         MDumvPKSRlKZUoPI2Otf7G3PXB8R+eOO8N757C70cMrALim/UT87sS73D5gj3sewQNnL
         sDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686652820; x=1689244820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdczPZ7i6NweZc4Vs1GEhNBw4P6SDuu4rOPlRce3Cp8=;
        b=FNi3kfoaey8FUqLX9+hc7OdJfBEkf865V8tAClPfmN4CSGl9HkLyxbIwXERz6nV/0e
         IeXqN0Qw+iE19W5trI7SDeMWJxat/PZCDRQhWdrMCnjXF6U9ixrHnSGU/YDMYg0oC9mH
         lKvHay1+o+DRJ/vJOEmf4v/RsGMrDLMpuaMgZCrzhLUCd4zivgd7FEWOwQHva3ADjBrO
         g5+U7Fw9cdoxoV4JT481AC5c6apViAxT47qGL7c4TzBJK+EwHwTlT9UX9diYc3zcc4kV
         16I4BAweOswv9sf/4WNgxbMd+qYXcVj03VJSJIdbgUPaTCi4cCOmJ2SV9A5ZEzVB/3SO
         x8WQ==
X-Gm-Message-State: AC+VfDy+CQaUjwhq3hLoP+iTYuPcwwOUlAZULB1mjMOqO7G3uzfsZcIK
        2qbVjlEUfxiMtDzX+qiD7g79Mw==
X-Google-Smtp-Source: ACHHUZ4WVznCWcsmGLMHRuA7VS6Lfj4mur40fa3EhFHuVyQQIFEL0bzMUHobk+R5es5R/aHSdgmKUw==
X-Received: by 2002:a19:6402:0:b0:4f6:2cd8:5ff4 with SMTP id y2-20020a196402000000b004f62cd85ff4mr5562119lfb.2.1686652820609;
        Tue, 13 Jun 2023 03:40:20 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id m7-20020a056000008700b0030fa166d8a1sm12458137wrx.34.2023.06.13.03.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 03:40:20 -0700 (PDT)
Date:   Tue, 13 Jun 2023 11:40:18 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org,
        deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
        jingoohan1@gmail.com, dan.carpenter@linaro.org,
        michael.j.ruhl@intel.com, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-sh@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PATCH v2 06/38] backlight/lv5207lp: Rename struct
 lv5207lp_platform_data.fbdev to 'dev'
Message-ID: <20230613104018.GF169438@aspen.lan>
References: <20230612141352.29939-1-tzimmermann@suse.de>
 <20230612141352.29939-7-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612141352.29939-7-tzimmermann@suse.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Jun 12, 2023 at 04:07:44PM +0200, Thomas Zimmermann wrote:
> Rename struct lv5207lp_platform_data.fbdev to 'dev', as it stores a
> pointer to the Linux platform device; not the fbdev device. Makes
> the code easier to understand.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: linux-sh@vger.kernel.org
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
