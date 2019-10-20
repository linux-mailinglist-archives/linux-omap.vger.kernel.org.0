Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EDAFDE092
	for <lists+linux-omap@lfdr.de>; Sun, 20 Oct 2019 22:59:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726301AbfJTU7F (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 20 Oct 2019 16:59:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:57698 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726130AbfJTU7E (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 20 Oct 2019 16:59:04 -0400
Received: from earth.universe (cust-west-pareq2-46-193-15-226.wb.wifirst.net [46.193.15.226])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4018721897;
        Sun, 20 Oct 2019 20:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571605143;
        bh=boQTUh6Tu3qH0IM4MLL8CiD1+e4eE1S96fTvHVhm1ag=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NBG1cM5qOQrze7OykO5KU0Se1QvaaBaF8whQY3PDe5eW2IrcDjZETeURTMQdLBMA0
         G4y8eZW3jdwVGn5KAFEzXj2MrTlnSmyOMqDlaVo+069m6wpn6vRMZOcHJgfO2IZXWs
         Wu+0LmS5tyC5L0qz7PrqHBKcI17esRVmp6DVQUAI=
Received: by earth.universe (Postfix, from userid 1000)
        id 3C7253C0CA0; Sun, 20 Oct 2019 22:59:01 +0200 (CEST)
Date:   Sun, 20 Oct 2019 22:59:01 +0200
From:   Sebastian Reichel <sre@kernel.org>
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     Tony Lindgren <tony@atomide.com>, Adam Ford <aford173@gmail.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        linux-bluetooth@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCHv2 4/4] Bluetooth: btwilink: drop superseded driver
Message-ID: <20191020205901.56bafijk7cu3rpaj@earth.universe>
References: <20191003134147.9458-1-sre@kernel.org>
 <20191003134147.9458-5-sre@kernel.org>
 <BC1F82AC-2988-4BC6-99EA-1C9F9289E582@holtmann.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="td6khbzgjxudi7vx"
Content-Disposition: inline
In-Reply-To: <BC1F82AC-2988-4BC6-99EA-1C9F9289E582@holtmann.org>
User-Agent: NeoMutt/20180716
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--td6khbzgjxudi7vx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Oct 16, 2019 at 09:15:03PM +0200, Marcel Holtmann wrote:
> > All users of this driver have been converted to the serdev based
> > hci_ll driver. The unused driver can be safely dropped now.
> >=20
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> > drivers/bluetooth/Kconfig    |  11 --
> > drivers/bluetooth/Makefile   |   1 -
> > drivers/bluetooth/btwilink.c | 337 -----------------------------------
> > 3 files changed, 349 deletions(-)
> > delete mode 100644 drivers/bluetooth/btwilink.c
>=20
> patch has been applied to bluetooth-next tree.
>=20
> However what I really like to see is that you re-introduce a
> btwilink driver that is purely serdev based and doesn=E2=80=99t rely on
> any hci_uart/hci_ldisc code. A clean serdev only driver is that
> best and easier to maintain long term.

So basically move the serdev implementation from hci_ll.c into its
own driver and make hci_ll hci_uart based only? That effectively
means, that we have two implementations of the protocol. I don't
think this will improve maintainability, since then bugs needs to
be fixed in two places? Note, that we have a couple of drivers
with serdev+hci_uart by now:

for file in $(grep -l serdev drivers/bluetooth/hci_*c) ; grep -l hci_uart_r=
egister_proto "${file}"
hci_bcm.c
hci_h5.c
hci_ldisc.c
hci_ll.c
hci_mrvl.c
hci_qca.c

-- Sebastian

--td6khbzgjxudi7vx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl2sypEACgkQ2O7X88g7
+pp5QQ/9HZr+yWBHDmBiphnMo30Xi90YCZ1Ov6RyGhUJWw2lvBcGkkHGCLuk8M/6
qvfk4YCI7zdqajXZkVSB7+dRp6QWkt4D5+B8ORjDC1zc103auFsIZmdTBn3c/8/O
Ed5DR6BKdGgtpdYxnsidYb3GJ5oMCHW9emRVJ603nUrbaipJTlEELjtyC8qemPtK
px9eTLAAD15WLhImFcq3vs9zP6mZV7EkTIgoIYAoUSJ6MQyapAeQbN19WTn7j+i8
YF3bB9+NCmM6Y2WJtuzBfq8n4B06OqSB8Yx2oNqRAFNlajIk7AnFwdU9JUj8rdYi
UrPzL+F0jzitbw0ES05xushHWmMXP+0I4XljEcjiq+UUd3/VkYYYegca+gXmTl+4
9DSQuITzpuhnKKgV7+VnlxIRg21KFrvC5Xib0BkDCYyTJq085hCq7b97aMlK/YJW
o04C9zu2vlvtFflQ5ENR5T/t7A6mSpUVcwCOme3o2AhhW7rWWrGZAhFhIq2PFxLp
9uOTquKl+WbW+rZM+Jx9RhrgGPivmEs+zFzV+bNESuLLcPB3v+b865NvRD+ESzZw
lFMocVKVE6zgwgy5UiX9/43dcBIdaPeSLdcgz1KoTt91ugDEwzLaaBMkeJjZtsdi
8qcw1yxVVk+sRBf4PgApEwvvaei+KF4AoNE59m4b5OIkZo4+bPQ=
=OkWc
-----END PGP SIGNATURE-----

--td6khbzgjxudi7vx--
