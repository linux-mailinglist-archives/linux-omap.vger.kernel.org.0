Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65D06307575
	for <lists+linux-omap@lfdr.de>; Thu, 28 Jan 2021 13:05:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231396AbhA1MDw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 28 Jan 2021 07:03:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231473AbhA1MCp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 28 Jan 2021 07:02:45 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB8A6C061786
        for <linux-omap@vger.kernel.org>; Thu, 28 Jan 2021 04:02:04 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id q8so7213103lfm.10
        for <linux-omap@vger.kernel.org>; Thu, 28 Jan 2021 04:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=usfc03r7bo+9iWnGhn3YJY+bfRfQpQsiPPvtGVZjTJo=;
        b=npthAUeo3rWK36iMclfXUXlzdH0VQDifjmso0bBCFVXOyQtra7DzyHgEmzJCt30dt/
         SJ9fMz6E+ZXbymrWtxziw9opC0BGbilGWBJXbYZg/g+BYXgWz07+qrex1EOMXMqIpzpE
         6jYfIeX/eLZOEM3VQR+NV2YEMCt5h3yT2zkYs2fBjC+YshcbiveecNrV2CoAJtG6ZVel
         ii8PNYw1BYp2K+WyqndwkTLNHTfxmpxwnUysv03/L8DCd9xBIWL+Ex04T8ZFQN2SR4Jv
         XJrieSOBP7Hg+fXfNeCpqIezF0N6+ilCD2nUbDQYYsRnM51XurcjK/Q5y7e31SHMaiG8
         0S7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=usfc03r7bo+9iWnGhn3YJY+bfRfQpQsiPPvtGVZjTJo=;
        b=W5/y/QzlE+xTbH2rm8SDykRZDwTPpEnsz396WDRKZ5Tqt+dPxTP4e/X2MLUb/Zl/0l
         K7SgcAGJlMs9jhbaWnrknXGq+qBB7KKK5qOWQNivYBTg7Il7xioRmHQ0tk//UVKeEhbh
         uilmVY90RkLHrxaSZgw2sRdWQ/63KF/6cBieByV962Kd8QRkFRLfzt9g7VhVlS6dpz7U
         CG09zaRhn3WpVMtTDy/SZ3gqwcSH6iz3k45DPKdeq2B93bibtFvkGnRwz+tGw97lyG+P
         rk2hLy1kC0sasVhyxAPxFQypdS0diDUfd556IKE0OQIBiLQHQ7SZxpngW8mTQtjE7g9D
         4Zbg==
X-Gm-Message-State: AOAM532WejmBeOlZ216ehgzI+LTO67+2z++7L2b22CW62qoEeXCuIZH3
        VnK5WNub5c9VQELAHTeYdgzAo5xBfYMcqiAkQOgjPw==
X-Google-Smtp-Source: ABdhPJza5WEqdY64nMdJh4p+Ysom/A+I1BzOUDl9O6I2P4XzvnsQTS6dm+guTw4PUOLC3FEaVrkSaMBAp3FtmqHRCno=
X-Received: by 2002:a19:b8e:: with SMTP id 136mr7679656lfl.29.1611835321876;
 Thu, 28 Jan 2021 04:02:01 -0800 (PST)
MIME-Version: 1.0
References: <20210127000303.436595-1-drew@beagleboard.org> <20210127000303.436595-2-drew@beagleboard.org>
In-Reply-To: <20210127000303.436595-2-drew@beagleboard.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 28 Jan 2021 13:01:51 +0100
Message-ID: <CACRpkdYkyxXmxhikvnpxc07MmWPweFAphRPCMd02Ye4EyuOVNQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: am335x-boneblack.dts: unique gpio-line-names
To:     Drew Fustini <drew@beagleboard.org>
Cc:     =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Jan 27, 2021 at 1:05 AM Drew Fustini <drew@beagleboard.org> wrote:

> Based on linux-gpio discussion [1], it is best practice to make the
> gpio-line-names unique. Generic names like "[ethernet]" are replaced
> with the name of the unique signal on the AM3358 SoC ball corresponding
> to the gpio line. "[NC]" is also renamed to the standard "NC" name to
> represent "not connected".
>
> [1] https://lore.kernel.org/linux-gpio/20201216195357.GA2583366@x1/
>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
