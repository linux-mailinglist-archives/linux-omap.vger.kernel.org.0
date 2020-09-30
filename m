Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 446D327E407
	for <lists+linux-omap@lfdr.de>; Wed, 30 Sep 2020 10:44:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728358AbgI3Iot (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 30 Sep 2020 04:44:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbgI3Iot (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 30 Sep 2020 04:44:49 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9950BC0613D1
        for <linux-omap@vger.kernel.org>; Wed, 30 Sep 2020 01:44:48 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id u21so866595ljl.6
        for <linux-omap@vger.kernel.org>; Wed, 30 Sep 2020 01:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=e0o0cITbLOXW4+eb4zMVz/hDGXwXK4Yd1WHZKdH8XV8=;
        b=XQLsJ9sGnzpb2NBy2+CPEZ0bkgFSnVRiz4E2UQfJtSkQSaOFVyDtnJOG2dkjQYDmkE
         W//dHiLk0xV3Zp23dTeJyBfArI6iw0J4uTHlUCVjk4gDhPd6XU5Kq29dIPFyEGAsOyWG
         Hx3WYjYpbKvpn+0Nwz1G3RLbiMJOm66hTeXSNXF/SjGXhEJilsfBy4hIJN63EW5zVON8
         rpTgETkXc6ZqJ4Qs3BDy07LvNjVxbl/F6qEexSWdrRyD5qI47eZVvkqy/Wc7e15Mn6Ls
         giDpwRrjyoQIQ4GBKyjCcuusS4pBv4jdiVIOSFhJ/gqnkwPf5uVcupRq6uwUJS6XgdkY
         D56g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=e0o0cITbLOXW4+eb4zMVz/hDGXwXK4Yd1WHZKdH8XV8=;
        b=FiFmkbzJvcM2Vrw57N7KMxBJs63VdH2qFnkgbz5mIrSTfzqigZvDueQvWI2dPSZMAz
         G29lWo7crPfm4yDSUSGbq9Hyk7mBPXBEEM4TKJzXljulByhDUto9x5+7QFECoh7IRyO9
         p6qMIRChTYah6j5FvpYh8wTF8zz99Zq7xpIHGAXkDeh0zC0+sFC476xkv5VdqRnfLWjU
         +gbEwx75r4h6sbt3dMjejK6SKuWJZS8O8DBpcHjrZiw7I36J39OdtjTBt4Q9G+8kQZWk
         UZbYaf2N4i94Lmim2OhC0YnZ3OhpTiJLPesKdgDH+HUeCV5FW3tkmJxarfuu31v2W3sA
         Ejqg==
X-Gm-Message-State: AOAM532frHlg5KiDFrEiE+wStgB85IKIaF52+KCK7i6mnXYT+5z5hfh9
        3MjuJzAvYIE7ph+y3ViBHdrHqFUJfvr6251/TZw6Jw==
X-Google-Smtp-Source: ABdhPJxUMbdtUKth9ohwnhlzbPBIm4QoTd73PXwmY9CkkhyjzIiz7pcNYsPBKeLoiodHA/gG+0Fb9rfHe577eGY30bE=
X-Received: by 2002:a2e:a177:: with SMTP id u23mr523885ljl.104.1601455486858;
 Wed, 30 Sep 2020 01:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1601164493.git.mirq-linux@rere.qmqm.pl> <e3a3979657babf716e5f4072e373637ce86ad7ff.1601164493.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <e3a3979657babf716e5f4072e373637ce86ad7ff.1601164493.git.mirq-linux@rere.qmqm.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 30 Sep 2020 10:44:36 +0200
Message-ID: <CACRpkdaMHH35C1LqUROFBte3T00Lz0zApHy3hdZ83Z8EZR04hw@mail.gmail.com>
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

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I suppose it is easiest that Lee apply all patches to the MFD tree?

Yours,
Linus Walleij
