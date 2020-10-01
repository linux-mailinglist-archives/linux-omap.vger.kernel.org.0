Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B81B327FAFE
	for <lists+linux-omap@lfdr.de>; Thu,  1 Oct 2020 10:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730415AbgJAIFf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 1 Oct 2020 04:05:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725938AbgJAIFf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 1 Oct 2020 04:05:35 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F554C0613E3
        for <linux-omap@vger.kernel.org>; Thu,  1 Oct 2020 01:05:32 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id 77so5449486lfj.0
        for <linux-omap@vger.kernel.org>; Thu, 01 Oct 2020 01:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oD0xJ7OYZjHqEGvBsDJmvk7Ykj7Xfjm9WqSCaPEk7m4=;
        b=Jpu4J1DnA+br/ASW4WdisQlOXK4UidrwplQZbe39eqqFmOexgF2k549UrJ1F531bcW
         MKJ/QX395gkI39Fnd5VfejHXtOwYQ0nAHCtavxUnRUGdye6witucLTPSGxS2dDh/Vpwv
         fCwqlqYUJ6oOwPhytNEUntz0/b99Aey/RFaDDT7Os8KQbtujXgacuj5Xr85L7n/g5Gl2
         E5gPu6uPEtlfBIkoR3bsEbVb6Fwsc2XIwYlrJE0lqdHSmzQN0jw3HeXSbviogWAHRN5L
         zx/p5NfcxKWFT0v7atj09DI5CPhhjozsUy6/yGHKcmQJg2tL1/TmmRAJetSGsP2QdxVX
         ocqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oD0xJ7OYZjHqEGvBsDJmvk7Ykj7Xfjm9WqSCaPEk7m4=;
        b=ksdpJo5m48W89NkwQq/ROtjLK+4RoLjgvkeML2RXzSkzzoZB1g5bZYjEuqWjzqMaCW
         q8SpBwo8TTRszMIMpKALOLWbXeNtGv7Asd8tMbY6Zr5/VDUGvaJg0oEuKS0CXPYMJmkS
         6tquFHbssOcbNtHVcS81ysNtb6pVn5444z68dubmGiH42snVVzmnHLGPxOEkpRNRMR89
         6DmTZWa+6NHeVLJ6fxzn+bkfmzR9TIpE1pL6UGJkFtpjMIrl0xEKlBFlAO6JTQrqM8ld
         4kv0Du0oWbWnst2KDCTxz/zF6jvFjgyGq1YitGSD/3aHbv6NXhMM5KZzmkrW93dwaN7B
         uOqw==
X-Gm-Message-State: AOAM533+8UK/9XgTXvnLY/AlLjAiqzPKZZpY/If0PMGo7rp0f4T9scUS
        ZZGxf4PEXUXu7qqTnw1vVCrOwb5btBiJ2L2fG7Xs8g==
X-Google-Smtp-Source: ABdhPJycV6bIfpNeWksg3qgsL5zC3RG7Uc8PF0TykKgZAE5jcXHCIW5e0rMppGu6x7Jm4Q9sctPSFqP5JTa89PBZZ0s=
X-Received: by 2002:ac2:4c11:: with SMTP id t17mr2346590lfq.260.1601539530874;
 Thu, 01 Oct 2020 01:05:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200913230306.2061645-1-drew@beagleboard.org>
In-Reply-To: <20200913230306.2061645-1-drew@beagleboard.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 1 Oct 2020 10:05:19 +0200
Message-ID: <CACRpkdbTrzTMhpEBwmwokaFWOwzvCn2tTp4Kup9pOcQSs2BfVA@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: single: fix debug output when #pinctrl-cells
 = 2
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        Trent Piepho <tpiepho@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Sep 14, 2020 at 1:04 AM Drew Fustini <drew@beagleboard.org> wrote:

> The debug output in pcs_parse_one_pinctrl_entry() needs to be updated
> to print the correct pinctrl register value when #pinctrl-cells is 2.
>
> Fixes: a13395418888 ("pinctrl: single: parse #pinctrl-cells = 2")
> Reported-by: Trent Piepho <tpiepho@gmail.com>
> Link: https://lore.kernel.org/linux-omap/3139716.CMS8C0sQ7x@zen.local/
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
> v2 change:
> this is a fix to my prior email where I referred to #pinctrl-cells = 3
> which is incorrect.  pinctrl_spec.args_count is 3 but #pinctrl-cells = 2
> https://lore.kernel.org/linux-omap/20200913224746.2048603-1-drew@beagleboard.org/

Patch applied!

Yours,
Linus Walleij
