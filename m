Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDFAC41FC8
	for <lists+linux-omap@lfdr.de>; Wed, 12 Jun 2019 10:53:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408084AbfFLIx0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 12 Jun 2019 04:53:26 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34304 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408015AbfFLIx0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 12 Jun 2019 04:53:26 -0400
Received: by mail-lj1-f195.google.com with SMTP id p17so7102080ljg.1
        for <linux-omap@vger.kernel.org>; Wed, 12 Jun 2019 01:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nIawAQGWbLfWKTC3QZLXfcvTQA4CewZ25jbyqgy97+M=;
        b=jIFxE+K9E+9sLfOXVhz7UhSXRSFRim36eS6PxLRxoAg84JEx1jh75jRvY3qyffVITd
         lydhSmYqeZuBdXFrUO2/Sgn8Xtg4PTAZ+FTUb017+ByPeoR19sawrC03KCTTpAFi2Yoz
         6L3AijeU2ipvMHlSkoZQpDNjNNy1e73Ao6OfLDP2mitZeLPhkISb2JCO6lmtDVhfqm8Q
         4lJ0ruYaDTrE1CSiwuTn0QeCCc6ZvMJxAmCHrI9RtTmj2w8YuhwVHeZALl3GP9YO3Zxi
         CUVQr73huP0KWf+XXV4eXtrMAML8vpFJJdDsZr5UJFb2i4zWu9LSo/FJtTTifNf7c6yW
         AAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nIawAQGWbLfWKTC3QZLXfcvTQA4CewZ25jbyqgy97+M=;
        b=J+tpg7eJYK0dit48KovbszsHZTRT4RDuefPbruDr2gEVE8S40BlUndI46rUWL+JNI7
         IQM6eoQujzVhWzBm0U1xdBUhXbQT9CHXQV1v6mRp83DO3FIfrJYJCM9z8/Ze7P481Fbf
         SU/j5KmTlpllLJQYaOsZnyxwSsGK0wu9IP1Oekds0xvx/YSrxQf0TN2V3m6d0XejKHDU
         XVGM6cKqqUTNPlkULJEJzG0MrK+34BXplNp3MPTlXgowNCudQrzSVECQWlU+Jk0sU4iS
         b+VdpdEtpD2ju43cbMggU63BQfvNNRk7azCN7abExQTmBeS2+XAtNnuqJ0+eR4D7znIS
         HKDg==
X-Gm-Message-State: APjAAAUup/I1tn227Lj9B9iocuJm9ZcYgk3TCtMcVnFB6/eBBj+R3GTM
        LTq1Txwe9ZOae8o1fmiEg/xgPvaxdodKDsRoljIkYQ==
X-Google-Smtp-Source: APXvYqxNIIw9LCbyTcI5g6LaBsQRBR0wCq3T/j2cKTZRbhzfeQ43ACd8rs8QCnicFF7qmbfskgJqAyNjSj9WpNbJRTY=
X-Received: by 2002:a2e:9753:: with SMTP id f19mr3993428ljj.113.1560329604687;
 Wed, 12 Jun 2019 01:53:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190610171103.30903-1-grygorii.strashko@ti.com> <20190610171103.30903-13-grygorii.strashko@ti.com>
In-Reply-To: <20190610171103.30903-13-grygorii.strashko@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 12 Jun 2019 10:53:13 +0200
Message-ID: <CACRpkdamGnFfvmdd_-DMph+AYCjYjF4sF+YOEqKig3L7kn4dkw@mail.gmail.com>
Subject: Re: [PATCH-next 12/20] gpio: gpio-omap: simplify read-modify-write
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
> We already have a read-modify-write helper, but there's more that can
> be done with a read-modify-write helper if it returned the new value.
> Modify the existing helper to return the new value, and arrange for
> it to take one less argument by having the caller compute the register
> address.
>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Patch applied.

Yours,
Linus Walleij
