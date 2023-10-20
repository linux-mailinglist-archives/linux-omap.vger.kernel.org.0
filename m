Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 073987D1567
	for <lists+linux-omap@lfdr.de>; Fri, 20 Oct 2023 20:05:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377953AbjJTSFU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 20 Oct 2023 14:05:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377935AbjJTSFT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 20 Oct 2023 14:05:19 -0400
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a02:c205:3004:2154::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59BCDD51
        for <linux-omap@vger.kernel.org>; Fri, 20 Oct 2023 11:05:14 -0700 (PDT)
Received: from p200300ccff3d5d001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff3d:5d00:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <andreas@kemnade.info>)
        id 1qttrs-005EZM-Kq; Fri, 20 Oct 2023 20:05:04 +0200
Date:   Fri, 20 Oct 2023 20:05:03 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     openpvrsgx-devgroup@letux.org, linux-omap@vger.kernel.org,
        letux-kernel@openphoenux.org
Subject: Re: TI git rep for omap5-sgx-ddk-um-linux.git not available
Message-ID: <20231020200503.1ed2cef6@aktux>
In-Reply-To: <2014DE2B-59DD-453F-9D89-682F6AA261D8@goldelico.com>
References: <2014DE2B-59DD-453F-9D89-682F6AA261D8@goldelico.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On Fri, 20 Oct 2023 19:09:17 +0200
"H. Nikolaus Schaller" <hns@goldelico.com> wrote:

> Hello,
> 
> I am experiencing problems trying to git clone or remote update
> 
> 	https://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git
> 
> 	Error: RPC failed; HTTP 403 curl 22 The requested URL returned error: 403
> 
andi@aktux:~/epson$ git clone https://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git
Cloning into 'omap5-sgx-ddk-um-linux'...
remote: Enumerating objects: 3010, done.
remote: Counting objects: 100% (489/489), done.
remote: Compressing objects: 100% (310/310), done.
remote: Total 3010 (delta 244), reused 305 (delta 132), pack-reused 2521
Receiving objects: 100% (3010/3010), 157.51 MiB | 5.13 MiB/s, done.
Resolving deltas: 100% (1926/1926), done.

seems to work here.

Regards,
Andreas
