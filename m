Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6F5F12A7E0
	for <lists+linux-omap@lfdr.de>; Wed, 25 Dec 2019 13:53:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbfLYMxa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 25 Dec 2019 07:53:30 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:44676 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726414AbfLYMxa (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 25 Dec 2019 07:53:30 -0500
Received: by mail-il1-f194.google.com with SMTP id z12so18416321iln.11;
        Wed, 25 Dec 2019 04:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TXGQF3/KDO1zgaXAR6TAzsWRArHyWP6++8bZMWIayrY=;
        b=BmqPNLeBLPHY490CWbJVfy7w98jLr80ZA1inXydv/f6pvjGbYN8UHYyJai7BvKAJHc
         gbP0b+M8cwrXQG3O75ar53NKEJ+cq1lj674bZNvqgX9OsywaZcQvjgTVOOy/8Kf+wjPX
         TtGQ0VcAC0y7RjPyHQdgsmZBBr9m7xVmIA4zHG2wFNaq99tKMa2/oXVmtX1k0Az/jMSd
         1TA9nyzT6f6XDM0nA0gfQe21TwTRLux99m1fS8/gCfDIq8MINYbxTc145dDQ6DcyCn1+
         q0CqVIIXYTEi8ITug1CbZgH09+DefyR/C6+EUP16ZPX/Ai+ki0CZ9dJLFcpp0yJl28LR
         OcrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TXGQF3/KDO1zgaXAR6TAzsWRArHyWP6++8bZMWIayrY=;
        b=pQza7bXxIjVmKb2N63FZetdtrcPJbodipJH0utptWCjMdFQyHUfmWFS7rDISIbUR8z
         YrkN8HCQcvUjAMSrMcyjtBOLZ9qJXyDklf95ZoXw9NLfyzg82lIuwAtwX6fOBRbHCMPZ
         OzBY2Kj9AF6VAuBhkU6r1b4H30mciJT2q10Opm0LFFlhEgXq9q8ILqs76cAcTh9d3KvU
         VPU3jjUSkUivLArCztaimCefDQSuxxeTjDBtqAlNM9nXxp1FN56I70KThO7jnNRu73lu
         P7hQ384OTGzL4G36ew6cQt/5g1DojGByuzxwReXsmgxjNaWtpQw0cOpwRngRBk5iPu84
         Tp8g==
X-Gm-Message-State: APjAAAVKlaGMyTeenND3ssZfEGoCBBJG4YQEzzpjN6c8A7yJLOhz6eiY
        iZ0AfvLiMZgdVeklM2F0WBkq84kc7YAnvcc4kXt0xHjx
X-Google-Smtp-Source: APXvYqzIsyUJ2aDYpIXzN+pXO88Ij5mwzND8TTEzGDtSlQIqFJaNwUMUAkRw7L/q8P/srJYI4iEXI7zfLArkcZA4N5I=
X-Received: by 2002:a92:4e:: with SMTP id 75mr34032444ila.276.1577278409744;
 Wed, 25 Dec 2019 04:53:29 -0800 (PST)
MIME-Version: 1.0
References: <20191224161005.28083-1-nerv@dawncrow.de> <20191224184503.GK35479@atomide.com>
 <a8f64408-f581-e57d-0f5d-db42ff0a4288@dawncrow.de>
In-Reply-To: <a8f64408-f581-e57d-0f5d-db42ff0a4288@dawncrow.de>
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 25 Dec 2019 06:53:18 -0600
Message-ID: <CAHCN7xKMnfo5reY+VSs_iCv_NXs-E12dFcRXonz6cNe1-huSPQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: Add omap3-echo
To:     =?UTF-8?Q?Andr=C3=A9_Hentschel?= <nerv@dawncrow.de>
Cc:     Tony Lindgren <tony@atomide.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        Russell King <linux@arm.linux.org.uk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Dec 25, 2019 at 6:05 AM Andr=C3=A9 Hentschel <nerv@dawncrow.de> wro=
te:
>
> Am 24.12.19 um 19:45 schrieb Tony Lindgren:
> > * Andr=C3=A9 Hentschel <nerv@dawncrow.de> [191224 16:11]:
> >> This is the first generation Amazon Echo from 2016.
> >> Audio support is not yet implemented.
> >
> > OK looks good to me, just worried about one part:
> >
> >> +&sgx_module {
> >> +    status =3D "disabled";
> >> +};
> >
> > We should have a separate am3703.dtsi or whatever the SoC model
> > disabling sgx if not there on the SoC. That way board specific
> > dts files can just include it without having to debug this issue
> > over and over.
>
> Thanks for the quick review in that time of the year!
> The sgx issue came up in newer kernels and I had to bisect it to 3b72fc89=
5a2e57f70276b46f386f35d752adf555
> The device just wasn't booting without a message, so yes, we should make =
it easier for others to figure it out.
> SoC is DM3725 and only DM3730 has sgx support. And it's hard to say if th=
e base is am37xx or omap36xx.
> But I see the reasons you picked am3703, so I would move everything from =
omap36xx.dtsi to am3703.dtsi except sgx?

> And then include am3703.dtsi in omap36xx.dtsi before sgx support?

I can see value in having a 3703 base and including that in the 36xx
with SGX and DSP nodes, but why not jus make SGX disabled by default.
Those who want/need it can enable it on a per-board basis.
> Or would it be better to have sgx support in a separate dtsi?

I am not sure how much DSP stuff is in there, but the DM3730 is the
AM3703 + DSP and 3D.

adam
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
