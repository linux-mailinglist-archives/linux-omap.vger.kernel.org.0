Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FBE685F17
	for <lists+linux-omap@lfdr.de>; Thu,  8 Aug 2019 11:58:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731839AbfHHJ6J (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 8 Aug 2019 05:58:09 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:25376 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728289AbfHHJ6J (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 8 Aug 2019 05:58:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1565258287;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=1/f0k/H0a7K76vFEtcQN8S5GHIKWdhY5l6OaGUoHAj8=;
        b=GsnP6R7CEXEcVT/yM/KXuWTk0p0HvHOJeecDbCnQwgVJsTEpXuaCTgnA8vwr43oG/Y
        x0H2A+IfBWhQl5xkuntFSVVqtrhFzERiqtwi4CqemGRB5B5bLGgFrP2SotX7Nsp8au3B
        rI3FKEFsOEzavmRjzITFzNkHf6Podvac7+9xNuW4/1qBJoe3TyVn2ZDDtyW0FFPMfR0e
        JHdVlJ2NLZIZG2r6RVGPOFeMr8jW+lVVrmF+CNOLAiQIEsTHOgXACGCpp+ULt0WUvh3I
        /E6VoqF2YQFbDU/rEKHw6IN1AYxawYFM2h30LwIoFCFeMj4T2wb+da74u0vviShHgA7i
        bZ2A==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/vrwDCv1g=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.24 DYNA|AUTH)
        with ESMTPSA id j00b6dv789vvaoi
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Thu, 8 Aug 2019 11:57:57 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [Bug] v5.3-rc3: arm: omap5: omapdss: omap_fbdev_init fails with lpae config and reports dma_mask error
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20190808072431.GA29852@lst.de>
Date:   Thu, 8 Aug 2019 11:57:56 +0200
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Roger Quadros <rogerq@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel@pyra-handheld.com,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <7B845956-A04D-40D8-A433-5812576A72E8@goldelico.com>
References: <14A6738F-75C6-4479-8B15-FD7395EFC55E@goldelico.com> <DF565339-14BC-411D-9301-5651FA601733@goldelico.com> <20190808072431.GA29852@lst.de>
To:     Christoph Hellwig <hch@lst.de>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Christoph,

> Am 08.08.2019 um 09:24 schrieb Christoph Hellwig <hch@lst.de>:
>=20
> Hi Nikolaus,
>=20
> please try the patch below:
>=20
> diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c =
b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> index 561c4812545b..2c8abf07e617 100644
> --- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
> +++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> @@ -232,6 +232,8 @@ void omap_fbdev_init(struct drm_device *dev)
> 	if (!priv->num_pipes)
> 		return;
>=20
> +	dma_coerce_mask_and_coherent(dev->dev, DMA_BIT_MASK(32));
> +
> 	fbdev =3D kzalloc(sizeof(*fbdev), GFP_KERNEL);
> 	if (!fbdev)
> 		goto fail;

Yes, it fixes the issue!

BR and thanks,
Nikolaus=
