Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70E7641FA7
	for <lists+linux-omap@lfdr.de>; Wed, 12 Jun 2019 10:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbfFLIuY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 12 Jun 2019 04:50:24 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:46284 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404645AbfFLIuY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 12 Jun 2019 04:50:24 -0400
Received: by mail-lf1-f65.google.com with SMTP id z15so8741115lfh.13
        for <linux-omap@vger.kernel.org>; Wed, 12 Jun 2019 01:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vuhsj8ps7SoI8pHZaVFcrUKuy0qDciUA894xP8DRI1c=;
        b=lkw2vw781vVGMyosGrYdwEiUBnJCuHpUhii52spA1D374RnIXXcbWHhULpE9Cz5fmz
         jmB85H+7KSiCEmERTaGMa22EZKTl+3OYa8g0MsTQWD2uhjj/d5zIh3qg1+DMlc+4sK8Q
         mTgvWQZp4q10h23z1ayCPZIN3/NdXQys7b/IO4fiusknTFklvF1liA0BZAmhOCz3sFq6
         5Zah77HNqQZvTtXyZ2ccq5Eq8FftXW2Jr+J2H96Hi4sxFkZO9MjnuM0Rbc4Mr0Vdl8Rj
         9rXkL9rlg8PznPdeZHTFsQ71gEW2TvVtfPsHYmHcBeeSGoxKAsB+7Ke4HUnrh2Sx77Hg
         /DTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vuhsj8ps7SoI8pHZaVFcrUKuy0qDciUA894xP8DRI1c=;
        b=hT7YuEhaCm8VvTFZCvqQO7m5RnY5l80vCJ6GPuDZ+iCFZzy7LquSi0dkxa6Npglq3P
         +Cf/X4nd4UWcyrZqZ3Rtq01A8GmeBIxgGJMX/x9gLBdZH3CQKzFqvQaD8r8x2JPwB4Ir
         rpUjdXNhNyO1k+xSNIzu0ISog42d4XIkyXMxcJKfpyXt0sSd0eAshhedWS4x4olQ7YkC
         HvmlCU+ZijLsaQTXGT5iT87y7M2MqFIn2h7jD9vwIG2l53yfmipIKDRIUdMEIB3NBsd6
         c1K8TO7DHTDFOP2jWUc4t2nAyjhYj8kI9Fd6EZIhIvrv3r0DGtgdWVzxuP7/F2lHcxVF
         Qyjw==
X-Gm-Message-State: APjAAAUMsubw6pz3urM0kUwnejhj1fcAdgsQAP2aLF6QOgR11i/BCUz5
        6AsEPIBq7mjA7o8b3PjK8cGwTfuHTEktAj7yJuGTRQ==
X-Google-Smtp-Source: APXvYqx/Pz3jSzEmkSAKK/Db6SB9B240P45Yftu+HhZmeHD4XRNwcE1mRWbkkKG0GpZQ7u52u6oeOPXCKenRxEnY3+M=
X-Received: by 2002:ac2:5382:: with SMTP id g2mr39731956lfh.92.1560329422587;
 Wed, 12 Jun 2019 01:50:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190610171103.30903-1-grygorii.strashko@ti.com> <20190610171103.30903-10-grygorii.strashko@ti.com>
In-Reply-To: <20190610171103.30903-10-grygorii.strashko@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 12 Jun 2019 10:50:11 +0200
Message-ID: <CACRpkdYWjOx_=CTq0uHPD0eQhKytQSMwpkK7cFOC65v_ebPwWQ@mail.gmail.com>
Subject: Re: [PATCH-next 09/20] gpio: gpio-omap: simplify get_multiple()
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
> There is no reason to have helper functions to read the datain and
> dataout registers when they are only used in one location.  Simplify
> this code to make it more readable.
>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Patch applied.

Yours,
Linus Walleij
