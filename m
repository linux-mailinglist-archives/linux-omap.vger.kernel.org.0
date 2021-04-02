Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D825352FA8
	for <lists+linux-omap@lfdr.de>; Fri,  2 Apr 2021 21:21:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236459AbhDBTVH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 2 Apr 2021 15:21:07 -0400
Received: from smtp-17.italiaonline.it ([213.209.10.17]:51335 "EHLO libero.it"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236270AbhDBTVG (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 2 Apr 2021 15:21:06 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([87.20.116.197])
        by smtp-17.iol.local with ESMTPA
        id SPLllsyFltpGHSPLpl2FsN; Fri, 02 Apr 2021 21:21:03 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1617391263; bh=R6GHCx3CerAOJ+ryJ+EbVwiXfLqRKvfStzoQSk5u4Z8=;
        h=From;
        b=PNpxoOPjsruurWBuIP4BWB+8sXnwBBhpLq6WSMpi1i8HX+YlU7REHjLC1NNMthbeM
         7WRA01kYa4OYmU/dvxCy1YHm9Ik8T9LkSUcKs2FVWQ/8YMu+ikOjOgwXBzfahF3dbB
         RvPrsEsdXqFWDyZQpLpiWprZD0IRiGFCQH0GNzllnh33CQuAlAtIG3PZunfZ2moISU
         x8w22+hGzhf8v2c9yyqsufWTjY2Uy2rgCd8DTVlkVsmzaYl/9Pc80QYtydjyBG3NJZ
         IfkFjm3fbmBADucPZrNj84LOpXvASE5gLRfAigz4oMEhZO2p/Jsba3lekk9IWY/Fg8
         oGhQOT7qfGxVA==
X-CNFS-Analysis: v=2.4 cv=Q7IXX66a c=1 sm=1 tr=0 ts=60676e9f cx=a_exe
 a=AVqmXbCQpuNSdJmApS5GbQ==:117 a=AVqmXbCQpuNSdJmApS5GbQ==:17 a=voM4FWlXAAAA:8
 a=pGLkceISAAAA:8 a=41Gc8jEUxQ3D8fAdJ3gA:9 a=IC2XNlieTeVoXbcui8wp:22
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dariobin@libero.it>, Bin Meng <bmeng.cn@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <kristo@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-omap@vger.kernel.org
Subject: [PATCH 0/2] fdt: translate address if #size-cells = <0>
Date:   Fri,  2 Apr 2021 21:20:52 +0200
Message-Id: <20210402192054.7934-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
X-CMAE-Envelope: MS4xfCtRTdCoLJ2l+ys7Y/9ueVP5NO0jLh0APftefEw44q51Um2Gxrttik/fbkAxgU+eAAceMxARlPUZC+g5WTy2N3TQgP/04rXbs9zGd7Ml7JQGhTHE0lzy
 9NgKitBC4BqWQVFXoTtbGmhyFto1sDlGm4xrUvu+OlsmMYkgFmPWvmEn+rFGroLXwTPIqkyM5FcIEgHDDHnehZZU2T34w8HlX51yV6TGeBn+Li9kqqeDXHRe
 Ry68FpenD4x++rm4UctLu0GEQra0ZCRZQvpTDN0SZGFN414hlWgfoBf9Dp5pu0KtkHaC8bbbh41WqyIrgIK07RgJozeD69XGRd5hMgEWyB7K3QNNoq6MaHrR
 nxHizmEFea+9Jkt5iUZrB07LRt6S/gKoJj8TguyDWLloa9eJvZGBYGGDLOkeKevpgGze4/ceayu5JFbUqV6NSMCGOTLWZxUtHGO6jB9weOehEqSTrguJrH8Z
 ft1Giu73nX3amVkdkChwORPL810+qXMc60P3+WoXzi41b+WYDppUpszAoSW0u4+ave8hzYhqpW6i/SGDsUBpL+f2xzXaEFgbttCvRw==
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


The series comes from my commit in U-boot
d64b9cdcd4 ("fdt: translate address if #size-cells = <0>")
and from the subsequent exchange of emails at the end of which I was
suggested to send the patch to the linux kernel
(https://patchwork.ozlabs.org/project/uboot/patch/1614324949-61314-1-git-send-email-bmeng.cn@gmail.com/).

The second patch of the series aims to demonstrate that the first one, which
enables the translation of addresses also for crossings of DT nodes
with #size-cells = <0>, it really works.


Dario Binacchi (2):
  fdt: translate address if #size-cells = <0>
  clk: ti: get register address from device tree

 drivers/clk/ti/clk.c     | 13 ++++++++++++-
 drivers/of/Kconfig       | 13 +++++++++++++
 drivers/of/address.c     |  8 +++++++-
 drivers/of/fdt_address.c |  6 ++++--
 4 files changed, 36 insertions(+), 4 deletions(-)

-- 
2.17.1

