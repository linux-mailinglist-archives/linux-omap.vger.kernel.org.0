Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33937CFE09
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2019 17:47:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727496AbfJHPq6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Oct 2019 11:46:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:48860 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726057AbfJHPq6 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 8 Oct 2019 11:46:58 -0400
Received: from earth.universe (dyndsl-091-096-052-071.ewe-ip-backbone.de [91.96.52.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C6C80206BB;
        Tue,  8 Oct 2019 15:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570549617;
        bh=CCKM5NxU0D+08pBgavIwoxggvzm+mkLRmmZcCw9gThg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mMK31W8PTX1H5WWrL8jWlMLAGVFyA6oVsMfyu735fk7Obj0Fh87LFpiCzGG/By9gV
         /xnMpA9iJhSpllQ13Kz5FkqzfKHHeN74qsLmFyfvYm+mZbXE4KGV4pGqTc/9zCYzqn
         99YgAKlITzq7/2Wcsk1F6faw6j2nDHvg2RnO/W3M=
Received: by earth.universe (Postfix, from userid 1000)
        id 4E1413C0CA1; Tue,  8 Oct 2019 17:46:55 +0200 (CEST)
Date:   Tue, 8 Oct 2019 17:46:55 +0200
From:   Sebastian Reichel <sre@kernel.org>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     linux-omap@vger.kernel.org, ssantosh@kernel.org, tony@atomide.com,
        s-anna@ti.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, p.zabel@pengutronix.de
Subject: Re: [PATCHv8 1/9] dt-bindings: omap: add new binding for PRM
 instances
Message-ID: <20191008154655.u34wkbqgmelv3aea@earth.universe>
References: <20191008125544.20679-1-t-kristo@ti.com>
 <20191008125544.20679-2-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ctyqydaobcxcfjee"
Content-Disposition: inline
In-Reply-To: <20191008125544.20679-2-t-kristo@ti.com>
User-Agent: NeoMutt/20180716
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--ctyqydaobcxcfjee
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Tue, Oct 08, 2019 at 03:55:36PM +0300, Tero Kristo wrote:
> +Example:
> +
> +prm_dsp2: prm@1b00 {
> +	compatible = "ti,omap-prm-inst", "ti,dra7-prm-inst";

Nit: compatible values are sorted the other way around (most
specific first).

-- Sebastian

--ctyqydaobcxcfjee
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl2cr2gACgkQ2O7X88g7
+pqWmxAAnbs6GjNR1+b2puQnzOpb3nsF6NWlckoiR/wBE5/utyC4v95yoB2Jm+sS
c7GlleJA5DmF8E40TuOq3HL/z+dt5P/vWX9egt0um6TtHZ3Z7rMWuwvv5TK+3St8
DF7ktlGqs2KG/E96LMf762P69CK2IccE7GUpY7N+MiFOZFuMJ7e+vUMyetuuSqeT
1r/RxLgyNAbeM5X0l4mN95Tv6A+aeuBr0jpX+N97vsEXUtdJ+5aLrlFX+8zsc/rn
LpexzXPaUDR5RgotC/+l9TxCAXwmHKJtPo0lLSsOWtctaD5MHYH/VkWAMCO3EGx8
YhOTT2ZNnfsR51Nc0mee/LzhrHGVYrnh+V15riJilNypnY+2wIw+B91xbJoMBFx2
PWLdwU+z67Cnc/+R/qaAYFNOQAfji1e+dAR5uAybReYzJGGRx+IOX/CInPuNZEdh
YMbngcINMVVEd3PzdCHUsIUOoXTpoAl0PlLVvLcf9JMxkn+5+SD23Sk+oNEjreVD
39Sb8bmrUG5C8DWBgddKpRE9dSbooLJhdkNApMUDdZwoluEDYeYlH2UDE+j7OkN6
kTZXans1Iq0fkkq/w/V3AQO5Z8aP+FHIIg6j6Jy6zD3C9L7Lw4EdhWFBBPDFpWp/
UGPs6TkWr0rre1fR657a3oKgv3OYwThEf3+bnTvbK7RiVQukc0Q=
=qzjC
-----END PGP SIGNATURE-----

--ctyqydaobcxcfjee--
