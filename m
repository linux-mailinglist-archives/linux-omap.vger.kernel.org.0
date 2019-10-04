Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC120CC6CC
	for <lists+linux-omap@lfdr.de>; Sat,  5 Oct 2019 01:59:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729948AbfJDX7A (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Oct 2019 19:59:00 -0400
Received: from egyptian.birch.relay.mailchannels.net ([23.83.209.56]:56985
        "EHLO egyptian.birch.relay.mailchannels.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725730AbfJDX7A (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 4 Oct 2019 19:59:00 -0400
X-Sender-Id: a2hosting|x-authuser|gsmecher@threespeedlogic.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id EA34F8C1B9B;
        Fri,  4 Oct 2019 23:52:31 +0000 (UTC)
Received: from mi3-ss2.a2hosting.com (100-96-87-199.trex.outbound.svc.cluster.local [100.96.87.199])
        (Authenticated sender: a2hosting)
        by relay.mailchannels.net (Postfix) with ESMTPA id B89798C199E;
        Fri,  4 Oct 2019 23:52:30 +0000 (UTC)
X-Sender-Id: a2hosting|x-authuser|gsmecher@threespeedlogic.com
Received: from mi3-ss2.a2hosting.com ([TEMPUNAVAIL]. [68.66.200.197])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
        by 0.0.0.0:2500 (trex/5.18.3);
        Fri, 04 Oct 2019 23:52:31 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: a2hosting|x-authuser|gsmecher@threespeedlogic.com
X-MailChannels-Auth-Id: a2hosting
X-Juvenile-Abortive: 2cccfe5837ad8e4d_1570233151679_4059249461
X-MC-Loop-Signature: 1570233151679:2669541974
X-MC-Ingress-Time: 1570233151679
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=threespeedlogic.com; s=default; h=Content-Type:In-Reply-To:MIME-Version:
        Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=Q8BxvX3DMBws5dkJLATmzJZixhwXgmSBrqOfQ+jEjX4=; b=CpnE52qq9Taqi8vtQDPNCUajs
        vKioTVH2urUkwhnKdfFZZTYeSfj2Y6ejzLWafSEjNyTWWTgOSkgBR0K4BC4W7OZIGQAP/Y5AvRKE/
        W7xS+OckhjYKQ60voVcH+ZU+QDhJ9Nkgz4voxErk87Dvbm1PYYdqrQtaMfvw8Xgqtw5oq2r23qZjW
        NHy+yIWFgeuFBSuYjl01e52ala0lNVOgyG5Q7mfzNzm6bSF+6OqlrQBy0UMsFz3cqReIQ3JhF69vt
        we0dBMEbR2Kp7TIxWdVItOO2Tk3WD5OjDpJ6bmkFNZu3892lqDXBwnA0veqbtn56UnGymhMbgbW2O
        wNTaYd1qQ==;
Received: from 107-190-23-133.cpe.teksavvy.com ([107.190.23.133]:39320 helo=[192.168.0.103])
        by mi3-ss2.a2hosting.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <gsmecher@threespeedlogic.com>)
        id 1iGXN2-002Tg8-OH; Fri, 04 Oct 2019 19:52:24 -0400
Subject: Re: [PATCH] ARM: dts: am3874-iceboard: Fix 'i2c-mux-idle-disconnect'
 usage
To:     Andrey Smirnov <andrew.smirnov@gmail.com>,
        linux-omap@vger.kernel.org
Cc:     =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191004014548.29583-1-andrew.smirnov@gmail.com>
From:   Graeme Smecher <gsmecher@threespeedlogic.com>
Message-ID: <c40b8414-45a8-575a-c3c8-902ed35e5764@threespeedlogic.com>
Date:   Fri, 4 Oct 2019 16:52:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191004014548.29583-1-andrew.smirnov@gmail.com>
Content-Type: multipart/mixed;
 boundary="------------D88F802452A7457DB086316E"
Content-Language: en-US
X-AuthUser: gsmecher@threespeedlogic.com
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This is a multi-part message in MIME format.
--------------D88F802452A7457DB086316E
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Andrey,

On 2019-10-03 6:45 p.m., Andrey Smirnov wrote:
> According to
> Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt,
> i2c-mux-idle-disconnect is a property of a parent node since it
> pertains to the mux/switch as a whole, so move it there and drop all
> of the concurrences in child nodes.
>=20
> Fixes: d031773169df ("ARM: dts: Adds device tree file for McGill's IceB=
oard, based on TI AM3874")
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Beno=C3=AEt Cousson <bcousson@baylibre.com>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Graeme Smecher <gsmecher@threespeedlogic.com>
> Cc: linux-omap@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>=20
> This is purely a drive-by fix, since it concerns the HW I've never
> heard of before. However I was working with PCA9548
> (vf610-zii-scu4-aib is my HW) and looking at various users in the
> kernel, when this code caught my eye. Apologies for the noise if this
> fix is somehow bogus.
>=20
> In case that it matters this patch is based on top of 5.4-rc1.

Thanks! We do have I2C address collisions on downstream bus segments, so
keeping these segments isolated is important. I'm surprised this patch
was necessary and happy to see it.

Lightly tested on 5.3.

Tested-by: Graeme Smecher <gsmecher@threespeedlogic.com>

cheers,
Graeme

--------------D88F802452A7457DB086316E
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
gbQuluiSg2k+M+9FMQ=3D=3D
=3DO3pl
-----END PGP PUBLIC KEY BLOCK-----

--------------D88F802452A7457DB086316E--
