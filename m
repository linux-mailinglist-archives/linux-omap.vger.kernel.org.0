Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9866351AEA
	for <lists+linux-omap@lfdr.de>; Mon, 24 Jun 2019 20:45:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728714AbfFXSpN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Jun 2019 14:45:13 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:16171 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726285AbfFXSpM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Jun 2019 14:45:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1561401910;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=s0LbhSknlCM5hc8ANHokTmG0D8Dtvf0T0SdiBQitSTY=;
        b=fTbb0NiwuBQ0VbR5R9c/m30pxhd8Q2KsH1atqNSCJt9Q76rh8E48Jrh5ixhjfxfjXV
        Rvbi+esRxMofHc6sKYLFbGRsbjD0omlbgnJphUXuc6FM0ddbxcZUfgq04xCCRZ1dZaEK
        qh6n9JVaEZk0zTEKKwcltmvsmSW31/yzJ6gNdEPBltC714syrZZQU5S0UJ7EEVw12H28
        6RHvlaiW5dp2J9cIn0wY/ZChLgXGFt1sNDfb9A49NQiY6+NJQL/lN4tpwYip3x89j7yv
        1H+a1jcQ/yxGSnxCpXNlv/p9hZrOaZKwJi6eWnd6g/AP+0yu1zUrvYe3gsBjS2CgyLIB
        GdkQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAgw4vuNw=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.24 DYNA|AUTH)
        with ESMTPSA id V09459v5OIj0Rvj
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Mon, 24 Jun 2019 20:45:00 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH v3 0/5] drm/panel-simple: Add panel parameters for ortustech-com37h3m05dtc/99dtc and sharp-lq070y3dg3b
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <cover.1559905870.git.hns@goldelico.com>
Date:   Mon, 24 Jun 2019 20:44:59 +0200
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, letux-kernel@openphoenux.org,
        devicetree@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <0842FF88-D8E0-441B-837B-769C2EF6C1CB@goldelico.com>
References: <cover.1559905870.git.hns@goldelico.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, tomi.valkeinen@ti.com,
        imirkin@alum.mit.edu, marek.belisko@gmail.com,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

> Am 07.06.2019 um 13:11 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
> V3:
> * add bindings documentation (suggested by sam@ravnborg.org)
>=20
> V2 2019-06-05 07:07:05:
> * fix typo in 99dtc panel compatible string (reported by =
imirkin@alum.mit.edu)
>=20
> V1 2019-06-04 14:53:00:
>=20
> Since v5.2-rc1 OMAP is no longer using a special display driver =
architecture
> for DPI panels, but uses the general drm/panel/panel-simple.
>=20
> So we finally can add SoC independent panel definitions for two panel =
models
> which we already had worked on quite a while ago (before device tree =
was
> introduced):
>=20
> 	https://patchwork.kernel.org/patch/2851295/
>=20
>=20
>=20
> H. Nikolaus Schaller (5):
>  drm/panel: simple: Add Sharp LQ070Y3DG3B panel support
>  drm/panel: simple: Add Ortustech COM37H3M panel support
>  dt-bindings: drm/panel: simple: add ortustech,com37h3m05dtc panel
>  dt-bindings: drm/panel: simple: add ortustech,com37h3m99dtc panel
>  dt-bindings: drm/panel: simple: add sharp,lq070y3dg3b panel
>=20
> .../display/panel/ortustech,com37h3m05dtc.txt | 12 ++++
> .../display/panel/ortustech,com37h3m99dtc.txt | 12 ++++
> .../display/panel/sharp,lq070y3dg3b.txt       | 12 ++++
> drivers/gpu/drm/panel/panel-simple.c          | 63 +++++++++++++++++++
> 4 files changed, 99 insertions(+)
> create mode 100644 =
Documentation/devicetree/bindings/display/panel/ortustech,com37h3m05dtc.tx=
t
> create mode 100644 =
Documentation/devicetree/bindings/display/panel/ortustech,com37h3m99dtc.tx=
t
> create mode 100644 =
Documentation/devicetree/bindings/display/panel/sharp,lq070y3dg3b.txt
>=20
> --=20
> 2.19.1
>=20

any progress towards merging this somewhere? It did not yet arrive in =
linux-next.

BTW: should also be applied to 5.2

BR and thanks,
Nikolaus

