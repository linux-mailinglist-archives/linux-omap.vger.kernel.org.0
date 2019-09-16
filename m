Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18A7AB4445
	for <lists+linux-omap@lfdr.de>; Tue, 17 Sep 2019 00:52:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387721AbfIPWwy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Sep 2019 18:52:54 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34971 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387878AbfIPWwx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 16 Sep 2019 18:52:53 -0400
Received: by mail-lj1-f194.google.com with SMTP id m7so833148lji.2
        for <linux-omap@vger.kernel.org>; Mon, 16 Sep 2019 15:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Fuxh4/69TfsTp5kSLr3NAf2vwLbcB5bz5amxQOn1DxM=;
        b=y8A6Nuff18GQV+xvjwLdz9AvCVqtQy5IPTny0ZtqqHYIdkKI5Wr8ffhqzbd8bgAK0Y
         J9MIMX9qBS3CGC9qBSSDHaUUuuOhXGb/SOV/2mFlunMk1MykHuVtfHwDoxZ/tlap09HY
         yAdvM/Fo3CDALnMerWbV+3rkfvH9jR9mMVVw0diVZ0mSkavK21mUkzMmOp7J9JMHdXM3
         hABwxVG/IuITEQ6oT8dJOE0U4ey7NPuepCgO6fvYVp1/JhbETivFobOd3yST8138UNan
         Gjjw6mR8a99UGU4/hIFZ1Oi2STte3eaVIPA7TQeGsOLF/QR3UIQBDdtifPCShAM4OBEo
         SEkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fuxh4/69TfsTp5kSLr3NAf2vwLbcB5bz5amxQOn1DxM=;
        b=eR14ZqgPFZp8C1lM6CV3Fs7NqYXcQlSsBj9k+eDTsezfUlBDVB7zt33TuB16h0KXrY
         rHzchz34oSywPXsYU6pbPXkqAzElz88WMJJAdgeeTv+2NjUyhUPhsKmMTyydcT+HKJ4h
         KmNqZxPT3D64OVKwinfz26pwGPmDHFiEvIieP4P1ZZycgGlXjMc9/vROp6j8jFtPpUTG
         yauWT/08gCifwo9V3oxlUyXBFTaBU+Cp8F1nPuotrytGeAQ9/v4oY7Z9cOhv/fEkcULl
         +61jt6ke2AqtU+XzomuaYEaD/FNv6WRZ0QgHZfUXBQItejf/w64/GJT+542Pfe685nXy
         tIJg==
X-Gm-Message-State: APjAAAVbbNuR51uPhjI/BIaKSDJgXY5xulROdv2vtpXnIkma2bq86CML
        3Fp6PH2BUCv0CzJ27mlEafWQdwg5kaiLEpEVRm2YGA==
X-Google-Smtp-Source: APXvYqwGy1I7yRYUC5GsL9M3sHMHfu2Glv6Iog+56mF0FKxkxRlZ2UB6VhXETbGZxc5XSiHrECt3zOilYIec4xwcGV8=
X-Received: by 2002:a2e:b4c4:: with SMTP id r4mr133951ljm.69.1568674371572;
 Mon, 16 Sep 2019 15:52:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1562597164.git.hns@goldelico.com> <8ae7cf816b22ef9cecee0d789fcf9e8a06495c39.1562597164.git.hns@goldelico.com>
 <20190724194259.GA25847@bogus> <2EA06398-E45B-481B-9A26-4DD2E043BF9C@goldelico.com>
 <CAL_JsqLe_Y9Z6MRt7ojgSVKAb9n95S8j=eGidSVNz2T83j-zPQ@mail.gmail.com>
 <CACRpkdY0AVnkRa8sV_Z54qfX9SYufvaYYhU0k2+LitXo0sLx2w@mail.gmail.com>
 <20190831084852.5e726cfa@aktux> <ED6A6797-D1F9-473B-ABFF-B6951A924BC1@goldelico.com>
In-Reply-To: <ED6A6797-D1F9-473B-ABFF-B6951A924BC1@goldelico.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 17 Sep 2019 00:52:39 +0200
Message-ID: <CACRpkdZQgPVvB=78vOFsHe5n45Vwe4N6JJOcm1_vz5FbAw9CYA@mail.gmail.com>
Subject: Re: [Letux-kernel] [PATCH 2/2] DTS: ARM: gta04: introduce legacy
 spi-cs-high to make display work again
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
        Rob Herring <robh@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        stable <stable@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Sep 16, 2019 at 12:59 PM H. Nikolaus Schaller <hns@goldelico.com> wrote:

> ping.
>
> Device omap3-gta04 is neither working with v5.3 nor linux-next quite a while and we need a solution.

Can't we just apply the last part of the patch in this thread:

diff --git a/arch/arm/boot/dts/omap3-gta04.dtsi
b/arch/arm/boot/dts/omap3-gta04.dtsi
index 9a9a29fe88ec..47bab8e1040e 100644
--- a/arch/arm/boot/dts/omap3-gta04.dtsi
+++ b/arch/arm/boot/dts/omap3-gta04.dtsi
@@ -124,6 +124,7 @@
                        spi-max-frequency = <100000>;
                        spi-cpol;
                        spi-cpha;
+                       spi-cs-high;

                        backlight= <&backlight>;
                        label = "lcd";


Surely this fixes the problem?

Yours,
Linus Walleij
