Return-Path: <linux-omap+bounces-60-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F9F7FC097
	for <lists+linux-omap@lfdr.de>; Tue, 28 Nov 2023 18:50:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E06C1C20A66
	for <lists+linux-omap@lfdr.de>; Tue, 28 Nov 2023 17:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FDD639AF6;
	Tue, 28 Nov 2023 17:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-omap@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5BEC10C3
	for <linux-omap@vger.kernel.org>; Tue, 28 Nov 2023 09:50:02 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r82DD-0008Kh-R5; Tue, 28 Nov 2023 18:49:31 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r82DA-00CEE8-AI; Tue, 28 Nov 2023 18:49:28 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r82DA-00AItg-0H; Tue, 28 Nov 2023 18:49:28 +0100
Date: Tue, 28 Nov 2023 18:49:27 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Tony Lindgren <tony@atomide.com>, Yuan Can <yuancan@huawei.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Rob Herring <robh@kernel.org>, Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
	Andy Gross <agross@kernel.org>, linux-sunxi@lists.linux.dev,
	Nick Alcock <nick.alcock@oracle.com>,
	Yangtao Li <frank.li@vivo.com>, Liu Ying <victor.liu@nxp.com>,
	linux-arm-msm@vger.kernel.org, Jay Fang <f.fangjian@huawei.com>,
	Hans de Goede <hdegoede@redhat.com>, linux-tegra@vger.kernel.org,
	Linux-OMAP <linux-omap@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	"Sicelo A. Mhlongo" <absicsz@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PULL v2] bus: Convert to platform remove callback returning void
Message-ID: <20231128174927.m46dgp4juig2omci@pengutronix.de>
References: <20231109202830.4124591-1-u.kleine-koenig@pengutronix.de>
 <1e5e1008-707b-449a-9dbf-48324eb2b248@app.fastmail.com>
 <20231116115307.32rovgcej2s5pe4r@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="53zsv2odqs745utj"
Content-Disposition: inline
In-Reply-To: <20231116115307.32rovgcej2s5pe4r@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-omap@vger.kernel.org


--53zsv2odqs745utj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Arnd,

On Thu, Nov 16, 2023 at 12:53:07PM +0100, Uwe Kleine-K=F6nig wrote:
> On Fri, Nov 10, 2023 at 07:32:01AM +0100, Arnd Bergmann wrote:
> > On Thu, Nov 9, 2023, at 21:28, Uwe Kleine-K=F6nig wrote:
> > > this series converts all drivers below drivers/bus to struct
> > > platform_driver::remove_new(). See commit 5c5a7680e67b ("platform:
> > > Provide a remove callback that returns no value") for an extended
> > > explanation and the eventual goal.
> > >
> > > drivers/bus/fsl-mc was already addressed earlier with a separate
> > > series[1].
> > >
> > > All conversations are trivial, because all .remove() callbacks return=
ed
> > > zero unconditionally.
> > >
> > > Some of the drivers touched here don't have a maintainer and there is=
 no
> > > maintainer for all of drivers/bus. It would be great if someone could=
 pick up
> > > the whole series, maybe Arnd might do that?
> >=20
> > Sure, please send a pull request to soc@kernel.org if there
> > are no further comments.
>=20
> here it comes:
>=20
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa=
86:
>=20
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

Here comes an updated PR. The only change is that it also includes two
Reviewed-by tags for Jernej Skrabec that came in after I sent the PR.
Obviously that changed the commit hash which made it necessary to redo
the PR. I hope it doesn't disturb your tooling that there are now two
similar pull requests.

Best regards
Uwe

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://git.pengutronix.de/git/ukl/linux tags/bus-platform-remove-void

for you to fetch changes up to fc540426f7baa0c7d4b477e80435d075659092a2:

  bus: ts-nbus: Convert to platform remove callback returning void (2023-11=
-28 18:43:27 +0100)

----------------------------------------------------------------
This series converts all drivers below drivers/bus to struct
platform_driver::remove_new(). See commit 5c5a7680e67b ("platform:
Provide a remove callback that returns no value") for an extended
explanation and the eventual goal.

After the initial simplification in commit 864acca58000 ("bus: fsl-mc:
Drop if block with always false condition") all conversations are
trivial because the remove callbacks all return zero unconditionally.

----------------------------------------------------------------
Uwe Kleine-K=F6nig (14):
      bus: fsl-mc: Drop if block with always false condition
      bus: fsl-mc: Convert to platform remove callback returning void
      bus: hisi_lpc: Convert to platform remove callback returning void
      bus: omap-ocp2scp: Convert to platform remove callback returning void
      bus: omap_l3_smx: Convert to platform remove callback returning void
      bus: qcom-ssc-block-bus: Convert to platform remove callback returnin=
g void
      bus: simple-pm-bus: Convert to platform remove callback returning void
      bus: sun50i-de2: Convert to platform remove callback returning void
      bus: sunxi-rsb: Convert to platform remove callback returning void
      bus: tegra-aconnect: Convert to platform remove callback returning vo=
id
      bus: tegra-gmi: Convert to platform remove callback returning void
      bus: ti-pwmss: Convert to platform remove callback returning void
      bus: ti-sysc: Convert to platform remove callback returning void
      bus: ts-nbus: Convert to platform remove callback returning void

 drivers/bus/fsl-mc/fsl-mc-bus.c  | 16 +++-------------
 drivers/bus/hisi_lpc.c           |  6 ++----
 drivers/bus/omap-ocp2scp.c       |  6 ++----
 drivers/bus/omap_l3_smx.c        |  6 ++----
 drivers/bus/qcom-ssc-block-bus.c |  6 ++----
 drivers/bus/simple-pm-bus.c      |  7 +++----
 drivers/bus/sun50i-de2.c         |  5 ++---
 drivers/bus/sunxi-rsb.c          |  6 ++----
 drivers/bus/tegra-aconnect.c     |  6 ++----
 drivers/bus/tegra-gmi.c          |  6 ++----
 drivers/bus/ti-pwmss.c           |  5 ++---
 drivers/bus/ti-sysc.c            |  6 ++----
 drivers/bus/ts-nbus.c            |  6 ++----
 13 files changed, 28 insertions(+), 59 deletions(-)


--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--53zsv2odqs745utj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVmKCcACgkQj4D7WH0S
/k66uAf+KEj6yCYL/fZUMESxp+ruHd0CIqqyeqoXs8QJkSZpBYf6q/1nJvHP8UV8
uwqqXDJ+/qN0XvfzFFY8sBUbw8aZhyPKUsrdXsauHjCYGMwjVDB2fWrmchk8J2cN
6yS1cKfZjexAhBrZm/02p1b6zTV6AMj3HYKEmTsFmZ3G9FcANo/zOro3prS0M4W6
79xe6KqnjNr0MCIHeBnnig/94vz408lqk+ebBS25Fy7JIkfsNTGrntTrQ/zbyQ/T
Oaegx6m+33HBtpLeK/L+dOLBzdSblKXZpSbbKD1NVT1q0aDcfnlXU8CHp080y0u/
Ppx52VMZg3hOXuwZtKcIZA1COE/NyA==
=jxQg
-----END PGP SIGNATURE-----

--53zsv2odqs745utj--

