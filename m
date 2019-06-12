Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 896AB41FE7
	for <lists+linux-omap@lfdr.de>; Wed, 12 Jun 2019 10:54:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731855AbfFLIya (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 12 Jun 2019 04:54:30 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33017 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437358AbfFLIyY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 12 Jun 2019 04:54:24 -0400
Received: by mail-lj1-f196.google.com with SMTP id h10so8507532ljg.0
        for <linux-omap@vger.kernel.org>; Wed, 12 Jun 2019 01:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5IKFQlxi0I3P+ssh5DIOko6Z7anWDy6UzmX3xFflNos=;
        b=Rz+qpRkAbq+hptik3GAI7okccDPVbInSsLaxqEtZTomNfsjlqRfd9PzKBT/YzBuNPE
         veYB4wGxhDLSH/ufDqUCISgInQPxltZputvSEzEcNMNOMAf9Ibxx9N5g5qc0qwH5gn8N
         Yafhk7x8bsm31SWMGMSv4Hnhrfg5fyrZggWpy7LS26LpYF/T/7M6qhr0mabXtEMvpDzh
         8CTTxM5sOHxKi26a35R7GIpCTvb4xnvsK1B2TIBF38F/LIoJ+EJa3pgDRmewKGlz4tKo
         gPg1dq7xGijhxl0IqDkiB6K/1PEXDtNrarjigDIXHs7l1kuLZ/WQCk0JN4Es9oe/Or72
         TJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5IKFQlxi0I3P+ssh5DIOko6Z7anWDy6UzmX3xFflNos=;
        b=YRAwQ0KwjFlmhrLrryb/1MW0QMUpnVFSZxb7AGiz6JcFHa81b7j8lWpdVeibBFd0XG
         EeW6DB/FlJUcMhav0a1hvD8EM6SmbZmRMEsGQ/nVQAvZ9snH70NEvlmZmr+O1uUKQ3/9
         yxLktNiMC0MRcXXrgiqMnxuEUX6wj4sC7quyuucAF4fcxmPpPSY0vB9uJZfGiYz6RKAf
         U6yzLCRzDHFauU5xMxeqktHWDPkzBGwjLaUeaMBgIjrlUFiXtOvC6xBbq8jRqRgbeWuz
         Ct4lioleX4UfGIDRDmJKGwDdf1pMQsjmCBxGP4SOPO5T+si/RaVLCAR61gRuYKGMOVul
         lJ7w==
X-Gm-Message-State: APjAAAXdjKhcLMN4ufqH9fAKrIPO0rHObfoAJhgoNRpb+N5swUjJCve9
        Dgh5ZIGKGmxtuSkUr4ageR+xCCSL6h0x1/vX+J502A==
X-Google-Smtp-Source: APXvYqxMH6dEoA+jip3uBxOPRmjugsKb0aIbkzeQ/8izSdJ+XQ+aTevZeOi2mpb9gqe3y8jgwkgiGr950I4ymBVhnDQ=
X-Received: by 2002:a2e:5bdd:: with SMTP id m90mr33803985lje.46.1560329662190;
 Wed, 12 Jun 2019 01:54:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190610171103.30903-1-grygorii.strashko@ti.com> <20190610171103.30903-14-grygorii.strashko@ti.com>
In-Reply-To: <20190610171103.30903-14-grygorii.strashko@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 12 Jun 2019 10:54:10 +0200
Message-ID: <CACRpkdZmnezPYiKpi+7Ka70YL4H4O=_Gv=DqXfvY9J4xv8X37Q@mail.gmail.com>
Subject: Re: [PATCH-next 13/20] gpio: gpio-omap: simplify omap_toggle_gpio_edge_triggering()
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Russell King <rmk@arm.linux.org.uk>,
        Tony Lindgren <tony@atomide.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Russell King <rmk+kernel@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Jun 10, 2019 at 7:12 PM Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> From: Russell King <rmk+kernel@armlinux.org.uk>
>
> This function open-codes an exclusive-or bitwise operation using an
> if() statement and explicitly setting or clearing the bit. Instead,
> use an exclusive-or operation instead, and simplify the function.
>
> We can combine the preprocessor conditional using IS_ENABLED() and
> gain some additional compilation coverage.
>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Patch applied.

Yours,
Linus Walleij
