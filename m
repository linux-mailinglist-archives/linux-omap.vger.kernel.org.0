Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B7B9391627
	for <lists+linux-omap@lfdr.de>; Wed, 26 May 2021 13:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232766AbhEZLcd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 May 2021 07:32:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232965AbhEZLcW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 26 May 2021 07:32:22 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2022C061343
        for <linux-omap@vger.kernel.org>; Wed, 26 May 2021 04:29:00 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id y197so1503947ybe.11
        for <linux-omap@vger.kernel.org>; Wed, 26 May 2021 04:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VZJmw4c/w1aJviXBkJs75wOQwEwbtioXuzg9Qv6tv5Y=;
        b=H0GiLBuoHLyqgHE/J91D74h4OQY++YzDVM96DR7+OsXwVLE5OPl7Hwtl29AZwm/Za7
         OADlmn1BNwhB8H38M2WUzEXkITgXSGkocLNKbnyEra2+ZT2+K6JOn2wIyzgc1Wnxn93w
         pkdIKPL7hlrK61sJMSv/AcpJgrd+iY/BUvGx9s3xCVDfK2I6x3WsvydAomSavlqHgn8z
         vL4x9RIVBPYU4b6WZsBmP5myKyJtjNwXLfnAaSsUxzkQJ2EOCDQPzbZ31GxVRG3Y2bHj
         dc80iBtM/D5RaDx5VWXcTkbJiJewOe9L1YRILEIRv5an3UAqKKG1FsePeVtBJyUkARjS
         V+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VZJmw4c/w1aJviXBkJs75wOQwEwbtioXuzg9Qv6tv5Y=;
        b=pjuLe5xh8/BE6a+0kyNL70J9+7O5U7tcqvZxt14XEdLAY/NRdgGB3szLAexOBkHEf4
         w4iQgmZDipKyVVzebX9dIYZdyYC/KYQ6L2ztoBh+Bjrcx8r9HesnfFeXhA/r/X58kOsL
         hChgf/Rix/NCkoZ1a3sWjOzZDIRjLqliXYjfLBueWUbmVVEAttp+KwW5e00WtjBTgRgy
         eThR2zOE1qliwYQsIqlZsBB9Xgqo5IayqoPGB2cMdyVt/68rFxkCrDzg/PsUnQWZ7sU+
         RWGgUSNPPdOUSm/hU7lbuIyPwsaGFNlmVp+TdwgBkqhJ5vReekLBHeALaTZEPa1ZAcgW
         NOvA==
X-Gm-Message-State: AOAM532DiaF2B4dsOyVAac0b5mHtA3K2kZi1Q1gQVeS1/NfemXb/mDvA
        6cqv/R/eZwN70e5e9AMXGr0qX3cAZtjrE88Fvi6Z0w==
X-Google-Smtp-Source: ABdhPJy1XkJQgfNmWeEbTm94qa+mEuNw5X68zb1bTQxhHHrPdFqHAV8LspcoAQallQ8h0F2T9t906bvCqOGSreByjl0=
X-Received: by 2002:a25:1804:: with SMTP id 4mr15627151yby.157.1622028540172;
 Wed, 26 May 2021 04:29:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210525175858.11611-1-grygorii.strashko@ti.com> <20210525175858.11611-6-grygorii.strashko@ti.com>
In-Reply-To: <20210525175858.11611-6-grygorii.strashko@ti.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 26 May 2021 13:28:49 +0200
Message-ID: <CAMpxmJWWS2dqRW_MPiFQq6c1wqFrKcEUbThZFyHeG1ZpgdGjJw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] dt-bindings: gpio: omap: Convert to json-schema
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        linux-devicetree <devicetree@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Aswath Govindraju <a-govindraju@ti.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, May 25, 2021 at 7:59 PM Grygorii Strashko
<grygorii.strashko@ti.com> wrote:
>
> Convert the OMAP GPIO Device Tree binding documentation to json-schema.
> The GPIO hogs node names defined to end with a 'hog' suffix.
>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Applied, thanks!

Bart
