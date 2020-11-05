Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49A812A7862
	for <lists+linux-omap@lfdr.de>; Thu,  5 Nov 2020 08:57:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727731AbgKEH5I (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Nov 2020 02:57:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725287AbgKEH5H (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Nov 2020 02:57:07 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D611C0613D2
        for <linux-omap@vger.kernel.org>; Wed,  4 Nov 2020 23:57:05 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id v144so905096lfa.13
        for <linux-omap@vger.kernel.org>; Wed, 04 Nov 2020 23:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=308hJZzaUbmvdeU54RQUNo8pQhYrFfiuEQmHsqSUMhs=;
        b=lHHA3F+j6jJOXITRA7KesznGB7VEYOeoHiKIVjdrK4MaiIGlwgL2s7HfGM8t4YmjAR
         IPscvhLw0bGvf/bJsGGSTXhbgpylfVvl/VBvMeJdKgrxldgmVewtHHDy02H9yXZVW1Hk
         rXXnrqM3Zghn9J4fm+sbZoPTK+dgekCFpQ7qvEP+FEB+TPTRSUSSJ3FTANRbHzNETr8Z
         sJ1sZzjJXx9NUlfQi/srVNhvIpUwqmE3KwYMo6A1z1u1ma8fsH2VvXS/ge8Ff2nTJHVL
         9k72VfLBM1NFV2qbicOskSJkcA62twAmVJoT4jWy5ggDaiMZwmqkZg79cOAXgvpBu0kz
         Bvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=308hJZzaUbmvdeU54RQUNo8pQhYrFfiuEQmHsqSUMhs=;
        b=QthCF9+eHPhxIYa5iDSyAglIY3Q/0C64RoxXhYbVLWuTSSYVqttCIG61nNzJJ8mxAp
         gGvTbIj9Mol3fKxL125ZzfIRSKy6hXCcwHgFRU7ph52G+ak8vAQdF1WTP8CgsiOBplpN
         mXeEfXfFMg10ZFjBdLOfB7Anw9Yht89lUf/XLz292AIlz7Ca+u1giTn8ay7TkV2zHYgi
         DM+Gtjpb0LxoUaIJSVSwrGEi+tSpdLOwhg3Ji2NpGc7zButYzd/Hi4sq1Z2VGXxEx6AS
         YziJNKnr7OqeZchP+ZxTvb7BH7WKOZvkeNU9Pb9beP59gDv/QfNxG1z3n1Rz6kVLoJfE
         ooGQ==
X-Gm-Message-State: AOAM5302QlahjJP1v3w6zJunk161YqUpOaXoc9M3Ej83/MRfENJLMrBf
        y8OqCNRiZDtCxHqnavfvm7onIL4hJvS3/Bg9kkeyfw==
X-Google-Smtp-Source: ABdhPJx16ZrBT1WG+PwPGLY85+LISLAnsGCJv8llI9La0Ohi7AJGnXDejqIaHXt2hwlZrKqx2cBKbJdNwXec7/1JTZ0=
X-Received: by 2002:a05:6512:322d:: with SMTP id f13mr452676lfe.571.1604563024053;
 Wed, 04 Nov 2020 23:57:04 -0800 (PST)
MIME-Version: 1.0
References: <cover.1601164493.git.mirq-linux@rere.qmqm.pl> <e3a3979657babf716e5f4072e373637ce86ad7ff.1601164493.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <e3a3979657babf716e5f4072e373637ce86ad7ff.1601164493.git.mirq-linux@rere.qmqm.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 Nov 2020 08:56:53 +0100
Message-ID: <CACRpkdb=XisqsuGSftKo4GbRm37av3GFCJUhcD9sH369czc=Cg@mail.gmail.com>
Subject: Re: [PATCH 1/5] gpio: tps65910: use regmap accessors
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, Sep 27, 2020 at 1:59 AM Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.=
qmqm.pl> wrote:

> Use regmap accessors directly for register manipulation - removing one
> layer of abstraction.
>
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
