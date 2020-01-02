Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9846A12EB1D
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jan 2020 22:15:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726019AbgABVPi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Jan 2020 16:15:38 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.164]:17938 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725790AbgABVPi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 2 Jan 2020 16:15:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1577999732;
        s=strato-dkim-0002; d=dawncrow.de;
        h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=/RFRtxHgJLOW/mYZm857emXRQ5DE6ixRmmVFe1r78O0=;
        b=peHvGjwldR76mFL7oUTcumXgJHztJ62GDQeYa6TAd5JbEqXM8kYSVHCmXtIi3OS9gS
        M0++9D8RGBOVvFgl9mKwIW4Ke5K/ROR9xIODA1feP6lkyV2D34pLOz1miJEnXnTD5Irx
        Hai4bE/qXZ2rnlOBx5x2+HLuJ1/utgKLQ8RfQKDgd/5hzFqEGDOC7+YSbC4zf/DaTZNo
        lEc8I5NvysLpLJbpaXXHRWCn+3m1X2fsTCbHoiJiTwyVhmZRgpBlQNGdBRaPckA5DA22
        fh+Omkxj+rk8tyq17unH4ws45yFTOuXOoWPSfPdQs+kl30J8N1WXqBeTNJkW+fWCcmZS
        Ba1g==
X-RZG-AUTH: ":ImkWY2CseuihIZy6ZWWciR6unPhpN+aXzZ6bi4rK0b8tGDimOzIxQbIOZSqtgWHzDs8="
X-RZG-CLASS-ID: mo00
Received: from [192.168.178.40]
        by smtp.strato.de (RZmta 46.1.3 DYNA|AUTH)
        with ESMTPSA id I099d1w02LFDLMy
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Thu, 2 Jan 2020 22:15:13 +0100 (CET)
Subject: Re: [PATCH v2 1/2] ARM: dts: Move interconnect target module for
 omap3 sgx to separate dtsi files
To:     Tony Lindgren <tony@atomide.com>
Cc:     mark.rutland@arm.com, devicetree@vger.kernel.org,
        linux@arm.linux.org.uk, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, bcousson@baylibre.com,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20191230202037.28836-1-nerv@dawncrow.de>
 <20200102193359.GE16702@atomide.com>
From:   =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Autocrypt: addr=nerv@dawncrow.de; prefer-encrypt=mutual; keydata=
 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
 BZtrxq8dmex7tFXvQoJV4PIa20fGXq6S
Message-ID: <9e39831c-bfa8-d497-7d3e-ff6ec04b8e52@dawncrow.de>
Date:   Thu, 2 Jan 2020 22:15:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200102193359.GE16702@atomide.com>
Content-Type: text/plain; charset=utf-8
Content-Language: de-LU
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Am 02.01.20 um 20:33 schrieb Tony Lindgren:
> * André Hentschel <nerv@dawncrow.de> [191230 20:22]:
>> Only dm3730 and am3715 come with SGX support
> 
> AFAIK dm3730 is just a marketing name for a catalog version of
> omap3630. So using omap36xx.dtsi is correct and we should not
> change that.
> 
> Can you please just add a minimal dm3725.dtsi that your board dts
> can include and avoid disabling sgx in the board specific file?
> That is assuming you have dm3725 with dsp and isp but no sgx.

I removed the sgx disable part already in 2/2.
Consulting my table:
     DM3730 | DM3725 | AM3715 | AM3703
DSP    X    |   X    |        |    
SGX    X    |        |   X    |    
Where X is "supported"

So including omap63xx.dtsi seems right after this patch moves the
sgx part to separate dtsi. Or do you want to have the sxg
disabling in the dm3725.dtsi?

> You can read the detected SoC with:
> 
> # cat /sys/bus/soc/devices/soc0/machine

# cat /sys/bus/soc/devices/soc0/machine
DM3725
# cat /sys/bus/soc/devices/soc0/revision 
ES1.2
