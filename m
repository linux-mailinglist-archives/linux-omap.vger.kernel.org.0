Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB1075FDC1C
	for <lists+linux-omap@lfdr.de>; Thu, 13 Oct 2022 16:09:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbiJMOJW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 13 Oct 2022 10:09:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbiJMOJV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 13 Oct 2022 10:09:21 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D62B3B9BF
        for <linux-omap@vger.kernel.org>; Thu, 13 Oct 2022 07:09:20 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-1324e7a1284so2394984fac.10
        for <linux-omap@vger.kernel.org>; Thu, 13 Oct 2022 07:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UrpocBWYkTC7PfXFYdMnjMZDwWMdGbupQiQC/ayeSR8=;
        b=foAkrtJRaTPssxN2ki6HTIxEo37+mP1UEVmjrRGIue19xGEM7AQeZbvoE0s/p4RaQY
         NERN+pmYWKhH7kIsuxuqzhLT/hFEyZfCnkBc4u9NfgYnNHKwvaj16F5NMgew+Iaiwfao
         9gJf2mxgIF33zB6pmuey1zV+PMKOLVsw+57Cv7RGvMZlvNaGAI1ZjG2xUE8l11WNVs3Q
         XRXJ25yQoPeHX+j21izAr86IdeFBCrLA+w0IL6bE4Ts+KyKxybOFGylZ9nJwgMLWwlln
         CiWqHICmA2bAfW5l8bo/mlwojTqYXL9iIvF8HjK4PeDA33kieVd1eVwId/Eh0wcKv1y1
         ADJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UrpocBWYkTC7PfXFYdMnjMZDwWMdGbupQiQC/ayeSR8=;
        b=qvGU39uwPEsLXtooapyFcbOi+WddEpCJNFbvXt0TWpAFUS57IjXCHKRHGvRXdo48Nu
         L+MsxImm6F5Q8jDjqBnyDvYMY5WB+ZGkwlrKj9sNZh9sWcPe2WP3pFzZgsjm47Ihxw2a
         rRdAj4glaAkGjwDobGaoLyYhVcJGdMxgCpCHeLUUzYoTwU5v7hrhZMzT2I6e/K3WQXwD
         6o6R3MIkQeqIdEreAe9puulmytxxwr94jzbBk69G4VgqHUf5hBGOeeZTHmI50kwvH+R3
         SGolJgqd46Hh+dI/ccyWCYKkWhuR4vsQZ1l/7cQhqZmK8ucqH+c74B/AD828bWPO/O7r
         3v8A==
X-Gm-Message-State: ACrzQf1sr7xKdQT3T0dJ/3KkoFIlBovUQQCTkaCl0deLNsnrucEGW2to
        0QSFGRXAyPmivJr7j46okqGv3w==
X-Google-Smtp-Source: AMsMyM599AohzqrOP8fG4E4v1ld3sGzIF2kltgBMOKQ0Ba6vq/KSRrCeX+MD8fgB/kAmrUAoehQcBg==
X-Received: by 2002:a05:6871:b06:b0:136:c445:82d0 with SMTP id fq6-20020a0568710b0600b00136c44582d0mr5531125oab.146.1665670159242;
        Thu, 13 Oct 2022 07:09:19 -0700 (PDT)
Received: from fedora (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id u127-20020a4a5785000000b0047f72b6988fsm2091450ooa.45.2022.10.13.07.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 07:09:18 -0700 (PDT)
Date:   Wed, 12 Oct 2022 20:50:38 -0400
From:   William Breathitt Gray <william.gray@linaro.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Vignesh Raghavendra <vigneshr@ti.com>,
        Julien Panis <jpanis@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-iio@vger.kernel.org, linux-omap@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] counter: ti-ecap-capture: fix IS_ERR() vs NULL check
Message-ID: <Y0dg3nsRgJHnPbmt@fedora>
References: <Y0bUbZvfDJHBG9C6@kili>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0xEguAtRZ42fF1HY"
Content-Disposition: inline
In-Reply-To: <Y0bUbZvfDJHBG9C6@kili>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DATE_IN_PAST_12_24,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--0xEguAtRZ42fF1HY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 12, 2022 at 05:51:25PM +0300, Dan Carpenter wrote:
> The devm_counter_alloc() function returns NULL on error.  It doesn't
> return error pointers.
>=20
> Fixes: 4e2f42aa00b6 ("counter: ti-ecap-capture: capture driver support fo=
r ECAP")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Queued for counter-fixes.

Thank you,

William Breathitt Gray

--0xEguAtRZ42fF1HY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCY0dg3gAKCRC1SFbKvhIj
Kw0yAP9G9K47RgJhiv6YlKAXlmvGOn+VhqTYBos/vT7HCFwlxgD/Q11klnu6M4sJ
cgZIrW08boKJd03vabfGZuS2ETk+QQU=
=GqHK
-----END PGP SIGNATURE-----

--0xEguAtRZ42fF1HY--
