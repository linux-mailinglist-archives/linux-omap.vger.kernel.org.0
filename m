Return-Path: <linux-omap+bounces-2442-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D749A222C
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2024 14:27:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43F422835E9
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2024 12:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B5811DD539;
	Thu, 17 Oct 2024 12:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N5VyLTfz"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0455A16BE2A;
	Thu, 17 Oct 2024 12:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729168052; cv=none; b=R9oFyVhCTluWbP/73vEjKyX9440/evgRdmXLV3fOQFlYmPxOQz8mxgvIPOhz8atTeCVZ2OeSZtyfqd0aFb20TneDfKomDNxVMUgsxXB8UWR5SYZFXWjd9jZTEhLzIJjScUjQXz5xmzy+XUzqCIo2nak53gHeSdDyDfPCJVNOeQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729168052; c=relaxed/simple;
	bh=yML8YLnaaxEbTZOnEVaz9cJvWjVJLT9ZoM8pWfFqnAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HOFsYZaoWLzL8OAcLuwgencs38Ybnsa+r6A8og1fyNuNTw+3fxJk/GymPBTrw8xjYey60mkhoftzEKTkGARLl68LDjtuD7xDmfnr8St/C+mza5GdyCITO+X8MHM2tpAAUIm+kU3mu3AYGOTQXwoh/UUxykS47nKVr83eDT7HD7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N5VyLTfz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72E65C4CEC3;
	Thu, 17 Oct 2024 12:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729168051;
	bh=yML8YLnaaxEbTZOnEVaz9cJvWjVJLT9ZoM8pWfFqnAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N5VyLTfz4HegLOGnLNKgp3gka/fENLvm+D10iNkmfvYP3WcZ9v9V1tboP0T81IKiA
	 RY/xE4YObwge5sKaJ99poSmkrvyVuvafhQDHaDlPoAqNSrN9TVOEAxuFLSk2SiZvHg
	 sZIkr4bKgLs0Avj5L1qEPdxVlHdIKbiLu4kCzWNqynYmU4KZE5plBiAThEfTsR+csQ
	 Q3iSHNfWGDi+rEoyg0hrc4EoTI3MKKFtTtS4mxi55/lmV7H/f4wL3LBfq9jlpoYnkI
	 uWZNgSeYQ0DvbCNcYzLcrw3QTK8bFJrvi50eQ9Mk6SglZpZAJpwbdaRRE0a6Ukfjnm
	 WVpyAqKVndO+Q==
Date: Thu, 17 Oct 2024 13:27:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Liu Jing <liujing@cmss.chinamobile.com>
Cc: peter.ujfalusi@gmail.com, jarkko.nikula@bitmer.com, lgirdwood@gmail.com,
	perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
	linux-omap@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Use card->dev in replace of the &pdev->dev argument in
 the dev_err function
Message-ID: <472cca80-5078-4da4-8956-5e4664cd4896@sirena.org.uk>
References: <20241015074938.6247-1-liujing@cmss.chinamobile.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/q42gE//8EX6uO5h"
Content-Disposition: inline
In-Reply-To: <20241015074938.6247-1-liujing@cmss.chinamobile.com>
X-Cookie: One picture is worth 128K words.


--/q42gE//8EX6uO5h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 15, 2024 at 03:49:38PM +0800, Liu Jing wrote:
> Because card->dev = &pdev->dev is already defined in the rx51_soc_probe function,
> and then &pdev->dev is still used.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--/q42gE//8EX6uO5h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcRAq0ACgkQJNaLcl1U
h9BkLAf7BD0R0IogvhM6zCSen+9sEo1tR8I0AA3KN5HzmTd/kYF6wH8RhJmSb9xW
VLdVMUpr459/nQlwyowLmzUvaEnL+r9dtu0B5w/+um+VNEAxc1Ij8PBl8b6WRmsp
AfuIO2089hOZ9u2epH+10orqPdYr7QlQuNhRxoChOw5+SvuAeHAk++TCOd1rCH7v
vboMNRKtr4Q756fx3Dh1hHk8Yo0IAcxwg8KrY8+I+0Y38ToKb/D/uezSR/qHt1do
ZaU4CsY86GyanpjU6v+KuUZ4JMIIRmnnkIk7ssq+SHKQYF5Pb44DeRF6x3JVs6EW
8HWR2sOeAiNk6nnSfJL88hDYcS69Ug==
=W4TK
-----END PGP SIGNATURE-----

--/q42gE//8EX6uO5h--

