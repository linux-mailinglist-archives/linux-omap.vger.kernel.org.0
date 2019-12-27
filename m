Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 041BF12B52E
	for <lists+linux-omap@lfdr.de>; Fri, 27 Dec 2019 15:29:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbfL0O3B (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 27 Dec 2019 09:29:01 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.164]:24270 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbfL0O3A (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 27 Dec 2019 09:29:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1577456937;
        s=strato-dkim-0002; d=dawncrow.de;
        h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=tiZqlNDnvx9lg//cU6oAkJTrBDkCfS6XbGyrlQGFD5k=;
        b=EqhvW37zOugrixABF9ybzwKK4GCDlcHu5TbInX6Ls6+QGcuY/7U/xVOYcyApprGaMm
        f3GzytQEA9/3m8HetqBxMYQLo5Hn9KtQpUp144yf6ULrNOEmp5TVjMoAjvDE0npMlYYh
        RyALc27w+WTC8UN9SoJLFsSY/4w0E3x8eVlnXLsqKlhUzxn2IiMMxYagvhtb9Z29n65A
        J+GPLbTJUnm801nHbjjkiGELfAO1SYimNekmX4T/UEl7NXdoc8UkeR4rCkcnaF+NrTRe
        WGsvXIfHkVTdysKoC2Vg+jz/shQzy0N6y+4ThexN6VqCKkkX+r8PEHa9CnFlnE8r//ol
        rBkg==
X-RZG-AUTH: ":ImkWY2CseuihIZy6ZWWciR6unPhpN+aXzZ6bi4rK0b8tGDimOzIxQbIOZSqtgWHzDs8="
X-RZG-CLASS-ID: mo00
Received: from [192.168.178.40]
        by smtp.strato.de (RZmta 46.1.3 DYNA|AUTH)
        with ESMTPSA id I099d1vBREST7GW
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Fri, 27 Dec 2019 15:28:29 +0100 (CET)
Subject: Re: [PATCH] ARM: dts: Add omap3-echo
To:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Tony Lindgren <tony@atomide.com>,
        Adam Ford <aford173@gmail.com>
Cc:     linux@arm.linux.org.uk, robh+dt@kernel.org, mark.rutland@arm.com,
        bcousson@baylibre.com, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20191224161005.28083-1-nerv@dawncrow.de>
 <20191224184503.GK35479@atomide.com>
 <60412339-53BF-4DC1-8AF6-4FB0E75D429C@goldelico.com>
From:   =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Autocrypt: addr=nerv@dawncrow.de; prefer-encrypt=mutual; keydata=
 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
 BZtrxq8dmex7tFXvQoJV4PIa20fGXq6S
Message-ID: <53e6cbbd-1094-cba2-4942-981502a738d4@dawncrow.de>
Date:   Fri, 27 Dec 2019 15:28:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <60412339-53BF-4DC1-8AF6-4FB0E75D429C@goldelico.com>
Content-Type: text/plain; charset=utf-8
Content-Language: de-LU
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Am 25.12.19 um 18:01 schrieb H. Nikolaus Schaller:
> I think the am3703 is a dm3730 (omap3630) where the SGX and the
> DSP have not passed production test and are "disabled" by eFuses.
> This is a common procedure in silicon production to increase yield.
> 
> Therefore, there is a register which allows to dynamically determine
> what components (SGX and DSP) are available on a specific SoC chip.
> See "Table 1-6. Chip Identification" in the common
> "AM/DM37x Multimedia Device TRM".
> 
> Such bits exists for omap34xx and for omap36xx (aka am37xx/dm37xx).
> 
> That way there is no need to disable/enable sgx through device tree
> variations and introducing more complexity by introducing more and more
> DTS for variants (am3703.dtsi, am3715.dtsi, dm3720.dtsi, dm3730.dtsi?).
> 
> BTW: what about a board that is/was produced in either am3703 or dm3730
> variants? Can they still share an omap36xx.dtsi based DTB?
> 
> So IMHO if there is an issue with sgx enabled on am3703 but no SGX
> hardware available on a specific SoC, the sysc setup should somehow read
> the bits and effectively disable all SGX related setup if it is not
> available on the SoC. If I remember correctly, some older hwmods did
> such things by checking SoC variant bits.

I like the idea, but I'm not in the position to vote for it and I don't
understand the sysc code enough to implement that.

Am 25.12.19 um 13:53 schrieb Adam Ford:
> On Wed, Dec 25, 2019 at 6:05 AM André Hentschel <nerv@dawncrow.de> wrote:
>> And then include am3703.dtsi in omap36xx.dtsi before sgx support?
> I can see value in having a 3703 base and including that in the 36xx
> with SGX and DSP nodes, but why not jus make SGX disabled by default.
> Those who want/need it can enable it on a per-board basis.
>> Or would it be better to have sgx support in a separate dtsi?
> 
> I am not sure how much DSP stuff is in there, but the DM3730 is the
> AM3703 + DSP and 3D.

For clarification this reduced table should help:
     DM3730 | DM3725 | AM3715 | AM3703
DSP    X    |   X    |        |    
SGX    X    |        |   X    |    

Where X is "supported"
