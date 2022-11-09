Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86B21622E38
	for <lists+linux-omap@lfdr.de>; Wed,  9 Nov 2022 15:44:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231629AbiKIOoy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Nov 2022 09:44:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230128AbiKIOox (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Nov 2022 09:44:53 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 131D81A395
        for <linux-omap@vger.kernel.org>; Wed,  9 Nov 2022 06:44:52 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id j15so26096410wrq.3
        for <linux-omap@vger.kernel.org>; Wed, 09 Nov 2022 06:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=newflow-co-uk.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+4S3lC7F0fSjRbh6HcH66tCyyW86t0VmiX9/wXKqMoo=;
        b=1+XBqG7xzylQDBCu7YxHXE8VL0EVu96uyJM5I2UvIQwuFNcDnBigTS2Nz38LxeoX8Q
         8FNH0rIDV/qFBnk+toSdVgATZJ/4SxeODjXERcP3+WVkszWUpVU/qZSHY9GWfJ4kIJcy
         pDDdZiF2qXsjkFNh8p9Nr0Gq0Ud4bV1M5uUUWI8Osk7QuXKYKynC6bfhY3748Ly7YNxV
         XzRbGsgfYT8v38vkmInhNTjyB4nl4pt2Xe0EiX2IzkLyRF/ANjP39Hxq1jxcik0nBmCY
         I618RpRfw/tfWJkYrDIXZxX5aexxppW4wj2UDz6IGl/by9JXxpULW7s4tP4+PzO+CJcq
         AQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+4S3lC7F0fSjRbh6HcH66tCyyW86t0VmiX9/wXKqMoo=;
        b=Phx3rodz4uIrZGr9ehIX2LmmtRZ66i74BMEHZ+ROMd8cDZqn4mliXCV/jy5Bp/kfNL
         KDsydzWw2Lb2dsynh0bZ6EXKQprdZ9YM3btE15ZnDiHklYzbb2cEXpsckUCN2JvO7Ww6
         wFBpc6YqQrzIe1NpjR0iPCNo+FwKy7Vbw3FcRT9dVmMi8qoHe3+OlWqUQFqkmGq/Xr7q
         lLI/ee3DqsyGepbLYYUrIieD5ZSaZ/VhXRZJDTe2zX4TeFCMdOqPIudVagcl8IsKwyMY
         2Gdyqn6kqWgp3SFUf9I0TfIVsOCfsfQ3RSfgAF1QZRmo+sO0ZtBBGMPw2gLEsX4bEdTN
         lljg==
X-Gm-Message-State: ACrzQf3p7CPWGyKB4JiqcFDWkxpWVdBjwVgGfp19jvuFf+TJoqSWGBw5
        sUShVKdbpV1aIsf1c/wV78bDttmtU3n9J9NRwoRsGOWy/sLXGg==
X-Google-Smtp-Source: AMsMyM7dQfVhmqXthQiVXOuuOOe3liFCrH8mG/c5x+iaHJFcZcDUAk5OUhkkcEKaHdLw4+kYLs+O03pXs8OuqiJ4POY=
X-Received: by 2002:a05:6000:1c1a:b0:236:8321:d875 with SMTP id
 ba26-20020a0560001c1a00b002368321d875mr38870978wrb.45.1668005090702; Wed, 09
 Nov 2022 06:44:50 -0800 (PST)
MIME-Version: 1.0
References: <20221004143901.130935-1-mpfj@newflow.co.uk> <CAAbcLfiCoa=-20cydPG9=42G9npaeBOCRXPPPTwkNFU-3yGoCg@mail.gmail.com>
 <20221108194742.0d9340f4@aktux> <Y2tYoHSFdJzrp9MW@atomide.com>
In-Reply-To: <Y2tYoHSFdJzrp9MW@atomide.com>
From:   Mark Jackson <mpfj@newflow.co.uk>
Date:   Wed, 9 Nov 2022 14:44:39 +0000
Message-ID: <CAAbcLfgYr1gfHNSycDc142aPuNUzxvhQ0GTyvExmMLa36e1nWg@mail.gmail.com>
Subject: Re: [PATCH] Update Nanobone
To:     Tony Lindgren <tony@atomide.com>
Cc:     Andreas Kemnade <andreas@kemnade.info>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 9 Nov 2022 at 07:37, Tony Lindgren <tony@atomide.com> wrote:
>
> The separate defconfig should not be needed. Please send any defconfig
> changes to multi_v7_defconfig or omap2plu_defconfig as separate patches.
>
> Note that you can run make savedefconfig first to produce a minimal diff.
> Then if adding device drivers, please add them as loadable modules where
> possible.

But using the omap2plus_defconfig increases my kernel to 4.7MB

My "custom" one has been specifically designed for the NANO platform
and currently sits at about 3.7MB (which nicely fits into the ~4MB memory
bank allocated to the kernel)

Hence the use of my custom defconfig.

I don't have modules enabled as the platform functionality is pretty fixed.

The defconfig I posted was created using savedefconfig.
Is it still wrong ?

Cheers
Mark J.
