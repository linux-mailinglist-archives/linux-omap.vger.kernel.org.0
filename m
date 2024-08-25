Return-Path: <linux-omap+bounces-2000-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 948F995E55A
	for <lists+linux-omap@lfdr.de>; Sun, 25 Aug 2024 22:49:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B96141C20936
	for <lists+linux-omap@lfdr.de>; Sun, 25 Aug 2024 20:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADDB916C84B;
	Sun, 25 Aug 2024 20:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="Zb8TNArZ";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="lPzWUZdX"
X-Original-To: linux-omap@vger.kernel.org
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2786F1DA4E;
	Sun, 25 Aug 2024 20:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724618975; cv=pass; b=pKt8VsyLXRIq5B9W6a5GYFfB4QECI4/hnRqvi4YbHL00SUOJibj/wDIYFwRMZpmW5mSTbd9ypYz+8ApFVyn1RGXUNOGAsVOQZJJ5Avua9FNlpQEuBtHTqNSr1WgbQwM3rbMlffffkKcgexcB3boRIgOT3dRf+gJwWrS22EXPkT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724618975; c=relaxed/simple;
	bh=BqIiSLAfEFk7KTtGk1nxU/OlLj0XMVWCngU7rnYrCRQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=eeQAGEibuQmVNF0yXMY2fzRWnEFuAS1X+UoqUFErEGHDm8udsYOqMxS+HQz0swnVct9JBbuBhkwlLYnOqJm1DCe+MK5J+sU9iwXaZM7QoqcYHoUUWlIrZC6JUe2dxsIJzCJp0dMDOlt06hNEWkq+X4ob6xfhKBRwQSX4+Eu7DMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=Zb8TNArZ; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=lPzWUZdX; arc=pass smtp.client-ip=85.215.255.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1724617887; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=QGActSi6qACLSVr3C1rdOZSH01YQx3mwBM4hUwV7HugBCYgcHvxkICYaIWEhrqUotW
    LHcSMWTM9bxKLHwJ62Oh6i7qGHsqHce1Sp2NB64jw8i8DNPl3izsEybzb6tcXGY6sued
    eYSwO0KvHaNJ/4UAtrO1+efxti9GqFZ+I/27r1f14oUEWihvjBf2msSY13OIHegz4pkA
    7NpjsAkhZe2d63Dgt1/mI+92L32OXrBV7+U03FbLj6hikZesLKgcX5KYcYC2svhfSgai
    DUsYhXRPLKZ8bY0qRTo4q4CZ3PvlcixQ0GkdQwQ92akMVuIWyO1l8kBwB1oOOG766ibN
    ZzZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1724617887;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=Z9BLSZuwrvSDL7iQx7DGiuZzslsd2OQ+ced4zl2PIn0=;
    b=Jzsr6DiBCDhpdBafEKTNrZYVTScP3e/fj41JQys2hTehsacR6n1sTATgu5oodeGJwt
    m50nl2EDCiWtb2n8971nF+JIR7FWRyMJlVNzaf59gi5LYvbzh8h5CuyTyG9Cv0CWM8Z/
    yE6JE3x5gNSyjaQD0x4ECoCg/SwWgUwxX/U2VAMpMk5A5ihYsM2XZ5LB4O8FAH0CQoIO
    M6dRn8dAA/A6iWc3ZfZpPiyxU2jssN2DfiYrzMPq5wQTYUSeDDTuLGY1xAxgzN0rh7/m
    VMvqK9h2DfTnCI3njanWtCKWch5ivHKEdZpvUi6evdGl10YLAsTD5y9gJDUz04GMpi0o
    gWaw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1724617887;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=Z9BLSZuwrvSDL7iQx7DGiuZzslsd2OQ+ced4zl2PIn0=;
    b=Zb8TNArZt7QVpi7YMCoey7torw6UEmMOgSCcwFR6wBgxa7BMbaQR4mq3UfRwprC1VG
    krGAnidyLaD/9IJkUdgo1XC/Y0jBYtgSXnJAZVS75zRz4CpJmsMxpoWQEsII6s4/B7sg
    zY3VE5gStby4U8O/wpRHFQUIpuusDhrcdMytQ0E++3bgoyqLce7kbAtw8DzHgMrfCDyU
    gPeNhTbK1fZtPn6xosdn7UYZdlfKnie8Qwq2HDIyaQZNeusKsiU5Drt5KRPb382XxwOK
    MWF0Sj17iEJHHnBK+xmdzDOj+cHiBthHAR1ZrMOwuZyooXB/xeRx+AA33PJX4DeW6b/B
    rx+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1724617887;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=Z9BLSZuwrvSDL7iQx7DGiuZzslsd2OQ+ced4zl2PIn0=;
    b=lPzWUZdXXdBLcLUMt4DRmk4VAskRCZDnyHsapP8B5gW/vlxlZQejCYNp7Po8yBPLaP
    4QsSCb5LbfhYEgF/IICA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yfz4Z"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.2.3 DYNA|AUTH)
    with ESMTPSA id Q984c207PKVQkZz
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Sun, 25 Aug 2024 22:31:26 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [PATCHv2 0/6] drm/omap: hdmi: improve hdmi4 CEC, add CEC for
 hdmi5
From: H. Nikolaus Schaller <hns@goldelico.com>
In-Reply-To: <20210302162403.983585-1-hverkuil-cisco@xs4all.nl>
Date: Sun, 25 Aug 2024 22:31:15 +0200
Cc: linux-media@vger.kernel.org,
 Sekhar Nori <nsekhar@ti.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Andreas Kemnade <andreas@kemnade.info>
Content-Transfer-Encoding: quoted-printable
Message-Id: <43F64377-8394-448F-A6F0-4DA11DB9AEF5@goldelico.com>
References: <20210302162403.983585-1-hverkuil-cisco@xs4all.nl>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3776.700.51)

Hi,
CEC features are useful to e.g. control HDMI monitor standby.

But I wonder what happened to this series?=20

I could find some reviewed-by: and acked-by: in [1] but it wasn't merged =
upstream
for unidentifiable reasons.

We apparently had merged this series some years ago into our LetuxOS =
distro kernel
and now we found it to be broken (NULL dereference) at least for =
omap5uevm
(and likely Pyra Handheld) after rebasing to v6.11-rc (it was already =
broken
since v6.9-rc1). Fixes were not difficult, but it would be better if it =
were
part of upstream.

BR and thanks,
Nikolaus

[1] =
https://lore.kernel.org/r/all/20210302162403.983585-4-hverkuil-cisco@xs4al=
l.nl/T/

> Am 02.03.2021 um 17:23 schrieb Hans Verkuil =
<hverkuil-cisco@xs4all.nl>:
>=20
> This series improves the drm_bridge support for CEC by introducing two
> new bridge ops in the first patch, and using those in the second =
patch.
>=20
> This makes it possible to call cec_s_conn_info() and set
> CEC_CAP_CONNECTOR_INFO for the CEC adapter, so userspace can associate
> the CEC adapter with the corresponding DRM connector.
>=20
> The third patch simplifies CEC physical address handling by using the
> cec_s_phys_addr_from_edid helper function that didn't exist when this
> code was originally written.
>=20
> The fourth patch adds the cec clock to ti,omap5-dss.txt.
>=20
> The fifth patch the missing cec clock to the dra7 and omap5 device =
tree,
> and the last patch adds CEC support to the OMAP5 driver.
>=20
> Tested with a Pandaboard and a Beagle X15 board.
>=20
> Regards,
>=20
> Hans
>=20
> Changes since v1:
>=20
> - as per suggestion from Laurent, changed cec_init/exit to
>  connector_attach/_detach which are just called for all
>  bridges. The DRM_BRIDGE_OP_CEC was dropped.
>=20
> - added patch to add the cec clock to ti,omap5-dss.txt
>=20
> - swapped the order of the last two patches
>=20
> - incorporated Tomi's suggestions for the hdmi5 CEC support.
>=20
> Hans Verkuil (6):
>  drm: drm_bridge: add connector_attach/detach bridge ops
>  drm/omapdrm/dss/hdmi4: switch to the connector bridge ops
>  drm/omapdrm/dss/hdmi4: simplify CEC Phys Addr handling
>  dt-bindings: display: ti: ti,omap5-dss.txt: add cec clock
>  dra7.dtsi/omap5.dtsi: add cec clock
>  drm/omapdrm/dss/hdmi5: add CEC support
>=20
> .../bindings/display/ti/ti,omap5-dss.txt      |   4 +-
> arch/arm/boot/dts/dra7.dtsi                   |   5 +-
> arch/arm/boot/dts/omap5.dtsi                  |   5 +-
> drivers/gpu/drm/drm_bridge_connector.c        |   9 +
> drivers/gpu/drm/omapdrm/Kconfig               |   8 +
> drivers/gpu/drm/omapdrm/Makefile              |   1 +
> drivers/gpu/drm/omapdrm/dss/hdmi.h            |   1 +
> drivers/gpu/drm/omapdrm/dss/hdmi4.c           |  40 ++--
> drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c       |  13 +-
> drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h       |  12 +-
> drivers/gpu/drm/omapdrm/dss/hdmi5.c           |  63 +++++-
> drivers/gpu/drm/omapdrm/dss/hdmi5_cec.c       | 209 ++++++++++++++++++
> drivers/gpu/drm/omapdrm/dss/hdmi5_cec.h       |  42 ++++
> drivers/gpu/drm/omapdrm/dss/hdmi5_core.c      |  35 ++-
> drivers/gpu/drm/omapdrm/dss/hdmi5_core.h      |  33 ++-
> include/drm/drm_bridge.h                      |  27 +++
> 16 files changed, 453 insertions(+), 54 deletions(-)
> create mode 100644 drivers/gpu/drm/omapdrm/dss/hdmi5_cec.c
> create mode 100644 drivers/gpu/drm/omapdrm/dss/hdmi5_cec.h
>=20
> --=20
> 2.30.1
>=20


