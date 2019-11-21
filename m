Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 908071053E0
	for <lists+linux-omap@lfdr.de>; Thu, 21 Nov 2019 15:03:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727096AbfKUOCp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 21 Nov 2019 09:02:45 -0500
Received: from mail-oi1-f170.google.com ([209.85.167.170]:40513 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727052AbfKUOCl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 21 Nov 2019 09:02:41 -0500
Received: by mail-oi1-f170.google.com with SMTP id d22so3244466oic.7
        for <linux-omap@vger.kernel.org>; Thu, 21 Nov 2019 06:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=gSXjQ0f+oApzzFPuizYMr38Nm5zR3fdbREkz17DHAxM=;
        b=GXc02Zpu50p9SUTHQDl1ds2rASVM7q4Azqqc5QB36elnwprHny1YCgfCfMkUhfMmda
         c2Lw4771SWwU9IL5qm6DWdHy2z70g9JJIMbQ8qllIT7/iyg++XSz5ZeV50+lb8RPBBiY
         QlzBcKW/9NTE0AUTCIQywmHOQDQo7ZcAiayu8QgpRJfIAp21PtrlZazClsb1CAWWniiR
         aajHEFFznzj6UTJWqJJEd++mSbyM8F1MkD4exJ/BBKU1wBm02oV9lhGmp6rgYLUCPPf4
         vVfS+a764OP6NcT0JOiKly0x1BZVGtCnLGOSCuft1MHYhTUvROZYKpC5RNvS//OGQrmQ
         WcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=gSXjQ0f+oApzzFPuizYMr38Nm5zR3fdbREkz17DHAxM=;
        b=rqrlVFD2vlWqcAo9Z+sg5bdRPXEaWnFnRy3mTRZ1rZdSpnxB2Qhfuh1ubJCWVNKzD7
         DU81vBczz+bdk7ZPva1jPQVZpfb4SY4ppK5eEPKqVJhsBFqeeugNiPrihkkLDnTviv3N
         cWr+sdfDfNNl389hQLRDkQ1g522Ei47wT+8y46A9h5j3tVxcXcNkDZElYd2eVPEpazc1
         wJhsV/DhkOmEjSaVwvti4RUUR7tMH3QzJquArU42vVPPC3x8hVB/JCYT2jgnYJwxLLuP
         LibnRGZtxqNpEyukYh3DymAQuzmwqhi+F1KJlucJu1Kl1RWD3+zTvmJ+c0LjFGVb5+7u
         ko8g==
X-Gm-Message-State: APjAAAWOYUr6pFJd8S8tJAWWOeJYkbwUJJCI7ULWOB7cuJ/rkcOBv2KQ
        ta9qBHW6O83KYWb3ABVfpX7GYnhHSljgFU2Utn+qtg==
X-Google-Smtp-Source: APXvYqzylAJc5yKQr6VWqxgjdXTfKANmO19daJ5oAi+BsETr3fIcN58XCbk/pF9709Y/kSa4HfAl5cu9XodYfBIjvhE=
X-Received: by 2002:aca:b909:: with SMTP id j9mr7322667oif.99.1574344958946;
 Thu, 21 Nov 2019 06:02:38 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a4a:2cc6:0:0:0:0:0 with HTTP; Thu, 21 Nov 2019 06:02:35
 -0800 (PST)
From:   Laurentiu-Cristian Duca <laurentiu.duca@gmail.com>
Date:   Thu, 21 Nov 2019 16:02:35 +0200
Message-ID: <CAPm8-H5MWhpnTF88ZFWwfWqnVKFZ+LoKFVF+nVAdynz62cW18w@mail.gmail.com>
Subject: omap4 mcspi interrupts do not appear
To:     linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello linux-omap community,

 I am an open source enthusiast and I am trying to modify
omap4 mcspi drivers in order to use interrupts instead of polling.
I use beaglebone black.
  After I set CS active and enable channel 0 and interrupts,
I receive only two interrupts (in fact a pair):
- tx0_empty and after this I fill the tx buffer by writing in the
mcspi tx reg n-times
and then reset the flag in IRQSTATUS
- as a follow up to the actions taken for tx0_empty,
rx0_full interrupt is risen and I read the mcspi rx reg n-times
and reset the flag in IRQSTATUS.
After that no interrupt comes (neither of tx_empty, rx_full or EOT)
even if interrupts and channel0 are enabled and CS is active,
so I can not transfer remaining data.
  FIFO is enabled and OMAP2_MCSPI_XFERLEVEL is setup accordingly to
transfer size.
  Note that if I want to transfer a message that needs only one pair
of interrupts,
then EOT interrupt comes, which is the expected behavior.
  If I use the polling method to see if something is pending on channel0
everything works well, but need to use interrupts
because I want to port this driver to Xenomai real-time linux.
  The dts for spi0 and spi1 is not changed.

  Any ideas? Did anybody successfully used interrupts (not dma) on omap4 mcspi?

Thank you and kind regards,
L-C. Duca
