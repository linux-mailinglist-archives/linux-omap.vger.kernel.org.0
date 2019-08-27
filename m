Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B61779E14F
	for <lists+linux-omap@lfdr.de>; Tue, 27 Aug 2019 10:11:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732302AbfH0ILY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Aug 2019 04:11:24 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41414 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731770AbfH0ILX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 27 Aug 2019 04:11:23 -0400
Received: by mail-wr1-f65.google.com with SMTP id j16so17783929wrr.8
        for <linux-omap@vger.kernel.org>; Tue, 27 Aug 2019 01:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=bee6elWyhvx9l1s3lDHd7XwIVoDBMWMNoB23LCxVG0A=;
        b=gzLgbjbEux4BhNuGtkhyV1DFquyPVRmOGfQoPzO/JpOqrHmUwitNeGKqjKW0XHlmTN
         L5MTm3zwo3YYcAthi7FEFWn3uuwQibCBOTuFu77+7TljFtfuGiyJR1zbt8IoIsaINb4a
         vCyahUgrX+JvCL2Rat/qCl15tIr3A8GDnL4BsshDDukwNYUCYyR47YLCzwowma554u9R
         uclegSe3b50FA0Le30n0JrHwN6lozqZ+ersbmrpp+REBDsSgBvyJJ2DWnbPnqQ8iMASA
         hDHlavMMLAaVNi6Sl0C6CQ4U51Z1cJnM6hGh7H7n2wHDXh05KYvaThLvF5CaA8kKiq/J
         uOBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=bee6elWyhvx9l1s3lDHd7XwIVoDBMWMNoB23LCxVG0A=;
        b=K3DktCvm1fQokUFowscE24H3TyzkXo1teDTInWVqohE96Mn1BrgjlrByfv3/keCRRG
         oGBxdBcYXphZpyljAcq/q+c1JECefbybccN7olCbswPhimiDXbXxZFTGPmicDj/e++VT
         kEkxLseX55t92v/fX+WEkuHOO8kcfikSx7jT2leSddN+vXVMcOcq9hY6OgJmmMmTy1zX
         zoCKvCpxmvwXq0siYKroyONN6pB5X2IKYS/LwVG1tDdfM4Il9P8YXebldvktFSRJELww
         J9+kdiPdAyeYMwPxfz4fD2IhSVjAfKPJktyuBCiq0iza/J8/lVTRBmn8hAZq5lNTKCpe
         kJJA==
X-Gm-Message-State: APjAAAUbLMdF4MIflezRtD0ZKbz5wVmmKNkbHMBWCCee3nREOKA65uwG
        De5M/uY+hW/YIO2JL2PVacY=
X-Google-Smtp-Source: APXvYqyfZ6vSZXuRSZsR5oanDP6/5O67eBlF6rB7mC2vWplRjVsEn5qcefiV+qjYYAlE/Mk5LXjJXQ==
X-Received: by 2002:a5d:6888:: with SMTP id h8mr1919682wru.68.1566893481982;
        Tue, 27 Aug 2019 01:11:21 -0700 (PDT)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id g14sm24958151wrb.38.2019.08.27.01.11.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Aug 2019 01:11:21 -0700 (PDT)
Date:   Tue, 27 Aug 2019 10:11:20 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Subject: Re: OMAP3 ROM RNG probe failure on N900
Message-ID: <20190827081120.6lvtmqrdh2un7kit@pali>
References: <20190823214655.GH30291@darkstar.musicnaut.iki.fi>
 <7d195797-085e-3bcc-933e-dca71dc12364@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d195797-085e-3bcc-933e-dca71dc12364@ti.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Monday 26 August 2019 11:00:21 Tero Kristo wrote:
> On 24.8.2019 0.46, Aaro Koskinen wrote:
> > Hi,
> > 
> > I was looking at N900 boot logs from the current mainline (v5.3-rc),
> > and noticed this:
> > 
> > [    3.297668] omap3_rom_rng: initializing
> > [    3.301940] omap3_rom_rng: unable to get RNG clock
> > [    3.307006] omap3-rom-rng: probe of omap3-rom-rng failed with error -2
> > 
> > It seems some clock data was deleted with 0ed266d7ae5e ("clk: ti: omap3:
> > cleanup unnecessary clock aliases"), including one for omap3-rom-rng.
> > How this driver is supposed to work now? I guess it has been broken for
> > a while. :-(
> 
> You should have a DT node for the device, which contains the clock handle.

Hello, I have not tested new kernel on N900 for a longer time. And at
that time (4.9) it worked fine. So it is just missing DT node? Maybe you
could fix it when you testing it?

-- 
Pali Rohár
pali.rohar@gmail.com
