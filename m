Return-Path: <linux-omap+bounces-2159-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED579971E31
	for <lists+linux-omap@lfdr.de>; Mon,  9 Sep 2024 17:38:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA213284239
	for <lists+linux-omap@lfdr.de>; Mon,  9 Sep 2024 15:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10FDF4D8DA;
	Mon,  9 Sep 2024 15:38:48 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7E641C63;
	Mon,  9 Sep 2024 15:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725896327; cv=none; b=Hj11Ao3/jt3BUvPrE9lbbItkPoL6G4pWJEPDGFHLHUZS/bqb3WGAAoJWAhHnKBOf8lMPIXsOROhBGQYypC3fE1PsDWfHztl9tpdYZVJlrKeKD9lslXY0GkJ4vnubqUgVzxiVw1DuaqM1heo44t24i/qcXuq0q7Xe7eANERoBxwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725896327; c=relaxed/simple;
	bh=ejGTtFr9UtD97Av6eKsXqC9yb/mVqCRD0gMrMg6wFBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KStT06bhHQugqFttb/1h0kv5Nvdr5gMo5dekh7jJtK7Mfc3zmTF3F4BLl0Qcoij0DGmhkEnq6ktFmriO/brqNWWJMpDOX4Il0PaoZ7njPAj6yBYm3KvP4AT8xdXAk9sn5rLmcWZycAdUXakyGrAE7FJRDfD0eJazSzQnVLLmBcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6d5893cd721so39747277b3.0;
        Mon, 09 Sep 2024 08:38:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725896324; x=1726501124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mFPvrWEZnfEN8TWP1cJnvMCekclj4UD9Cp6NnLKH86A=;
        b=UA1GiDAA85FEaI/5MDzqSh2cEptGEBJJRMAmzaRm798SLKiL2iTHfW+8QCF9enW+tH
         V6EMehzkmeEWQfMh+lAZW2hSQ64T7P6hjdAveusJHrHV/Gf1MELGBLVwy2pNbX/30c2+
         Z+0ipO3ZCOBCsMRSJNSVNr5IqHv+9JCrIE8u7K4AU4+0VzqdzQ3kVAm5U/eON67p6kQ+
         GULF7fVK2h3NqV3xNFkQjIrSh/VTtJSFPbCYxT2L+lbn+ry5GpH+GTU6yNBXuf1XSmWW
         JMm9wHdJGZbEXGsO+y2cTqG+NfXHOt/0YxvAlEkrmGGs0YY10mRyOg7gxIiDSGC6NGbR
         7vCg==
X-Forwarded-Encrypted: i=1; AJvYcCU2IfNyPLoaHyFmJ2b9uyKOyZfa3LfcWG2QtEfl380vL+8pRja4XvlmKidk4xBc4xjw5w/a3Im52A==@vger.kernel.org, AJvYcCUISdk8N7gFsHkwDCFiZCbx66ALf84177ZVeZR77+C2k2yDtrc6f8P3jnKQqMfpIZLDZP1cNnRleKDDEmcQgfL60+Q=@vger.kernel.org, AJvYcCUSfZqw5sCG/BH2rZ+wgPcd8Kb3ijOPZVyvpAxbsLPlHjU8GVErFmXDC/i2GyB/qJAPII3W88zZM33E7HI=@vger.kernel.org, AJvYcCUZTkpeM1mJOiDNPtXDeKc3RZJs/vX9D1yDhjtn/b5c3KNG6EMCOHnh7m2HkvSUiWSWKn/WhFQ8+Xp/HqEM1g==@vger.kernel.org, AJvYcCX8EkE1TKHJNvw1RFH5J2oAmPjE2O/GToCQKD5K+2o5RG5k+U0vA4/hkmU6aEnjouX7p62rqnfgrxPv5QsNlLt+1p8=@vger.kernel.org, AJvYcCXOa31e14sgDCJJTV6iWGgo6ZtyMm0wyulsOVlpFAWx/QJmErdYLshIjAM0Mg3k2WDbux2lsszvNv3J2g==@vger.kernel.org, AJvYcCXfFSAgMcyBpBWTo2Y9dHFobADrvYAoUSaWU/ilJMldKEoFcBE3wY9pbXO0UEQm6x0GF1gMnymZONKH@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/L/wmZZFkCRJgE9jdVDUkzgAEJe8HaV9EQfmLlmTJtf3pO+Ya
	H0r0zkyvSgODGVWfUPEJ+yb5jVKgBvXwuJer7CNezt4DlHjZ6Pvl13LYkEhX
X-Google-Smtp-Source: AGHT+IF/LRPU1IpjsVXAMZ06X9gLXB+6JhhEE0SLfN0Etg3fjEoAX5rNDbWpB54bqsIxul102NT8dA==
X-Received: by 2002:a05:690c:a99:b0:6d7:4dea:5f16 with SMTP id 00721157ae682-6db45133363mr150456387b3.26.1725896323956;
        Mon, 09 Sep 2024 08:38:43 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6db5c65d497sm9638957b3.61.2024.09.09.08.38.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 08:38:43 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6db449f274fso32348177b3.2;
        Mon, 09 Sep 2024 08:38:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU69ArOw0NR+gcfiwKrZgXoNGGcSsEeB/62T+rEHb6vVCvdjO8WzaGsBEGcPg9LZ75/OyDxeuaGRoXIus3ncgk3pjA=@vger.kernel.org, AJvYcCUNdjVFOSDJhYwKvgu03GKyid3vrvoExy0tpvB8i2VxY5UTyaOmxCl20UrKj/aeBk5vIUfz9mR6eyiE@vger.kernel.org, AJvYcCVq3USM7LLkRx2vn6tfMLG6fbBULbGEEjQTCgcKiTFwVecSfYDqbryfmVhuZvqP2Uq0ndupLdYb7OOdjA==@vger.kernel.org, AJvYcCW3htGEGKjEmQz68lJ78CjGiuGaYMIr1JEwJpfnvMo2J7RjUIQztYy+XOEqDXPVYmM/wKc0/jjjNs/C1rzwIy2ovDs=@vger.kernel.org, AJvYcCWGOcJr9p9UGCANMy85zr7/hyZhFGroP1kk1gZcHwNCzFIG8DdatD6qdpMlVmq1LXS1yyddQZ9gYiVhHew=@vger.kernel.org, AJvYcCXLRUfdj3tqqTil95Vq4oHD/EatYbTYLuvYbVPdiGaCo3Ku9BaCp8w4kXGzZ9KTsX5LkQHaJKcE1m9JurNgAg==@vger.kernel.org, AJvYcCXnLseH7uvlAAu/LEsojXAKOg7LmNv5ebpSZ/3GwSZKzbaUgSE85EyFPGz9IZ+e2Wo2SwO8DurQlA==@vger.kernel.org
X-Received: by 2002:a05:690c:a99:b0:6d7:4dea:5f16 with SMTP id
 00721157ae682-6db45133363mr150456127b3.26.1725896323567; Mon, 09 Sep 2024
 08:38:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240909144026.870565-2-u.kleine-koenig@baylibre.com>
In-Reply-To: <20240909144026.870565-2-u.kleine-koenig@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Sep 2024 17:38:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXOwfHgLwCSB-koVjW0eHDXkNvo_Af8eRkfbLPdU8ZrsA@mail.gmail.com>
Message-ID: <CAMuHMdXOwfHgLwCSB-koVjW0eHDXkNvo_Af8eRkfbLPdU8ZrsA@mail.gmail.com>
Subject: Re: [PATCH] clk: Switch back to struct platform_driver::remove()
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, arm-scmi@vger.kernel.org, 
	imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 4:40=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
>
> Convert all clk drivers to use .remove(), with the eventual goal to drop
> struct platform_driver::remove_new(). As .remove() and .remove_new() have
> the same prototypes, conversion is done by just changing the structure
> member name in the driver initializer.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>

>  drivers/clk/renesas/rcar-usb2-clock-sel.c       | 2 +-

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

