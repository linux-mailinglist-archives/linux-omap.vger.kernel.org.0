Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDD0FA8988
	for <lists+linux-omap@lfdr.de>; Wed,  4 Sep 2019 21:24:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730112AbfIDP1c (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 4 Sep 2019 11:27:32 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:38534 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726589AbfIDP1c (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 4 Sep 2019 11:27:32 -0400
Received: by mail-qt1-f194.google.com with SMTP id b2so21342198qtq.5
        for <linux-omap@vger.kernel.org>; Wed, 04 Sep 2019 08:27:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vcv2kx9szvF+nS0Klj5vVjUOMGNPX4cQA7OvUE3mRZ0=;
        b=Q8G7VaVY4MeU6CStW+JT6DJJu/PFLUk+x9R1RcPjGBZV2Zxfgcgt/e36P3bG2H4Rkt
         VYWeuDDw4I1xKn2VFiw6JfI395VU35VtEc9fi+LZXMGTjXHpsyuIW86c5WOBL1TXUztP
         Kj3g1EMr7JE5pB5TH1mtTxhzhVYPgKETWXIkI8krkRigkXlAmGF+vW/3BCiOECWFAxpH
         mHLzYgtpCuzfTBYY8XdIpcXfjcEy5tKooIcY+IMdy/S7cmFOxf8Jiq+lR5peR1okY3Fh
         bg57h7hmf5z6tCrdBj7PGI6cUgjuEaBaeMuWI/+6mY8Jzz5J3xojrTPVJ0gJ3lj18OVn
         TuFg==
X-Gm-Message-State: APjAAAV5Nrd3sfkBc1jg8hJf9+yH4dVN2VLbuiX7N7+iZ2AeOAG6eQOY
        2CHw9KKIOZQHOPDlE0TS43gRqby0CBrz2MZDzOk=
X-Google-Smtp-Source: APXvYqzydUUKuJ5DVQS4diifJxc8cj8YCum9qVe0SiQwumrEIlNAdmZQK21a8Qit1myHZqfxCqbDTkb40XKK8Ir0ELQ=
X-Received: by 2002:aed:2842:: with SMTP id r60mr30298236qtd.142.1567610851770;
 Wed, 04 Sep 2019 08:27:31 -0700 (PDT)
MIME-Version: 1.0
References: <pull-1567016893-318461@atomide.com> <pull-1567016893-318461@atomide.com-3>
In-Reply-To: <pull-1567016893-318461@atomide.com-3>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 4 Sep 2019 17:27:15 +0200
Message-ID: <CAK8P3a1C_OEPwrf-vdEmns5f87GN6dtsoda_WVmZAxEvLfFiDw@mail.gmail.com>
Subject: Re: [GIT PULL 3/4] drop more legacy pdata for omaps for v5.4
To:     Tony Lindgren <tony@atomide.com>
Cc:     SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Aug 28, 2019 at 8:35 PM Tony Lindgren <tony@atomide.com> wrote:
> Drop legacy platform data omap variants for v5.4
>
> We can now drop more platform data in favor of dts data for most
> devices like cpsw, gpio, i2c, mmc, uart and watchdog.
>
> In general we can do this by dropping legacy "ti,hwmods" custom dts
> property, and the platform data assuming the related dts data is correct.
> This is best done as single patch as otherwise we'd have to revert two
> patches in case of any unexpected issues, and we're just removing data.
>
> Fro cpsw, before we can do this, we need to configure the cpsw mdio clocks
> properly in dts though in the first patch. For omap4 i2c, we've already
> dropped the platform data earlier, but have been still allocting it
> dynamically based on the dts data based on the "ti,hwmods" property, but
> that is no longer needed. For d2d, we are missing the dts data, so we
> first add it and then drop the platform data.
>
> For dra7, we drop platform data and "ti,hwmods" for mcasp and mcspi.
> We've already dropped platform data earlier for gpio, i2c, mmc, and
> uart so we just need to drop "ti,hwmods" property for those.
>
> Note that this branch is based on earlier ti-sysc-fixes branch.

Pulled into arm/late, thanks!

     Arnd
