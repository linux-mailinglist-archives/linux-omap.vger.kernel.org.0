Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF73E643702
	for <lists+linux-omap@lfdr.de>; Mon,  5 Dec 2022 22:41:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230289AbiLEVli (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Dec 2022 16:41:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233704AbiLEVld (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Dec 2022 16:41:33 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 961AF27904;
        Mon,  5 Dec 2022 13:41:32 -0800 (PST)
Received: from mercury (unknown [185.209.196.162])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: sre)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 593FA6600368;
        Mon,  5 Dec 2022 21:41:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1670276491;
        bh=z3lfan09CK2D9wXcE8WBWvxWSfKIyD0HaJEgKtxKmJg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=A5TmyhxaOgmm1n69LVLpUNYKHMMOcEXcRX3ytL66smsWhqEgzA9Z3Uv3e0cRw8b+S
         oSDrJSMq/AaXcv0YWiNUJ2JqQyDbrZLXFJk6OvQRzko7uRvf1Q1OnQxws4k/54E/05
         C/vaSxkgr6pTXLSJXfHhC7C55YOuiNvzWsHC3NekJtlyOosSAgPWQN5CIVV0Hbxdcp
         1IZfmVR+HxYdU6rTfurJYd4pqGZmqQY5uOHDVi9eMpc6oUIMgQ1chlFd8Vqwul8tpg
         GV5BvRCPwSNiM8k/9+ccDE6teMQ3rLC1ZNyHSMPCFM+G9S+z2Hb3MbHzD0RhJbeePg
         7xUjU9bIp6kFQ==
Received: by mercury (Postfix, from userid 1000)
        id 29A891060F2F; Mon,  5 Dec 2022 22:41:29 +0100 (CET)
Date:   Mon, 5 Dec 2022 22:41:29 +0100
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Carl Philipp Klemm <philipp@uvos.xyz>
Cc:     linux-omap@vger.kernel.org, tony@atomide.com,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] leds: cpcap: make leds-cpcap an independent platform
 device to allow varying led setups
Message-ID: <20221205214129.3ixuusoenlzjz6cb@mercury.elektranox.org>
References: <20221204104313.17478-1-philipp@uvos.xyz>
 <20221204104313.17478-2-philipp@uvos.xyz>
 <20221205174857.asf6uant7ve7k5pe@mercury.elektranox.org>
 <20221205191548.13296b58d9121fec36769c97@uvos.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="udh3kcsxoruobyui"
Content-Disposition: inline
In-Reply-To: <20221205191548.13296b58d9121fec36769c97@uvos.xyz>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--udh3kcsxoruobyui
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Dec 05, 2022 at 07:15:48PM +0100, Carl Philipp Klemm wrote:
> > I don't follow. Can't you just use 'status =3D "disabled;"' for the
> > unavailable nodes?
>=20
> Sure but unless im missing something, adding some nodes to a dts, one
> for eatch led the device in question really has feals mutch better to
> me than going arround and setting every led channel disabled for eatch
> device that dosent use it. xt894 being the outlier here amoung the
> cpcap devices we intend to support (xt894, xt860, xt875, xt910, xt912,
> mb865, mz609 and mz617) in that it uses most of the extra led channels,
> most of these use at most one (xt875, xt910, xt912, mb865) or zero
> (mz609, mz617) extra channels.

Just mark them all status =3D 'disabled'; in the common include and
then enable them on a per board basis. Just the same way as all the
SoC peripherals are handled nowadays.

-- Sebastian

--udh3kcsxoruobyui
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmOOZYQACgkQ2O7X88g7
+pqTRA//YOOIAJ+dsCNfKROCmvPM4m5DaieEtm9ZV+VKisX79j2H7oCnfM8QoOCg
ipnGeIv2P5PGFhdxuOYZUrcoPMV2jtoXryBZmPzJ1r0CzqX8V0MARkVp2ie3JWNK
dDeSljSfZD0WgWyVIjz8Nu7D0P/uf1MRuBQUgn/dt8pB1bBNDATlxadaCBbS99dg
AbHfiW71AahDvLWjgq6dj+WMggF25X6cJV/FC2c38kLRxB/2LMbdq6Mte+B07Ch2
KPsifTwi2moKeVWcf/4+aE5VPoZHi9WWFuumpwpNiaMWjzY/s5U3CJGU7+zCQkLc
VEB23j/EqjjmXytHXr4rlOveteK4msqsaP+T7+mdf28Xj+TfObIwpYA8I44aAFUR
MC/fSASFUcPrSxXr0gSkr9Kahnncm9Et90BIpU0Lcd21HRyFbzzcYbjdnNOH0r/U
9nd/gVVqdm85ZtbpbyaEt2udmmBQ+QYgstiEb4l8okkG9xUz2ILuCuVmd5MxWtlB
3yhX5EY2i1dtbKIRRSp9QvZbYn3Nt+bc2oKrgjUKi/S7LNLUPNfjjVnMwgnx3r8b
AjdahZJ91NXh9eFVMS/+hvKrYH9p2u7AhuN+UUIAuyv0bnjuz24+7sUplnKQfmfX
xYDOPTAQ1pTVur/rYJZhJrX2JaQXDNzVjwFV66Skd2h2CqVvImM=
=7wAe
-----END PGP SIGNATURE-----

--udh3kcsxoruobyui--
