Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E14AF1B85B5
	for <lists+linux-omap@lfdr.de>; Sat, 25 Apr 2020 12:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbgDYKhR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 25 Apr 2020 06:37:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726050AbgDYKhR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Sat, 25 Apr 2020 06:37:17 -0400
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5302::9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE688C09B04A;
        Sat, 25 Apr 2020 03:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587811035;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=lHgOfYndEaX0qQHc0NsS77AGy8GRSm3/PHSzMoNzTaI=;
        b=I1hM0/iqiTWh+kW2EBjTTyEcCIYtny+Kwt+Fl/NfT+g4YSyJzZj9ujkCYn7WKN7AVA
        FtlpBC0LmG30PsKktevj603pWJGPPrHU9oBK3ZM1gXY6VUvPJnjt1MMhxnfm7huXjVOG
        oiqBphTeDICpjrL1lvYXxYymBz3hTZTyLPTQ+fjFm6PRCojNeC3pT3YaOAbmPau/G+/K
        A1wTegBOj823U/V5uVAq9j9jWiOMx90StF1xvQ4DaUiZhTlD9047mr08CIprqpZbWiKL
        1ssMhsouuQTNBYj2oI4O8MdMODaWl7p+NqQTOMHT6e+nAI1wdu+I7PWeoYE5mVcMg34H
        RPIw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAiw4yA"
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
        with ESMTPSA id R0acebw3PAb2FQ4
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Sat, 25 Apr 2020 12:37:02 +0200 (CEST)
Subject: Re: [PATCHv3] w1: omap-hdq: Simplify driver with PM runtime autosuspend
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <44AD9673-AE02-498F-A5CC-48499DF226E3@goldelico.com>
Date:   Sat, 25 Apr 2020 12:37:01 +0200
Cc:     Evgeniy Polyakov <zbr@ioremap.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Adam Ford <aford173@gmail.com>,
        "Andrew F . Davis" <afd@ti.com>, Vignesh R <vigneshr@ti.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E8575FE4-4BC2-41B7-B574-339C58D9CB5E@goldelico.com>
References: <3197C3F0-DEB9-4221-AFBD-4F2A08C84C4C@goldelico.com> <20200417164340.3d9043d1@aktux> <6430AF54-849E-456B-8DB0-B4478BBDB78D@goldelico.com> <20200417150721.GL37466@atomide.com> <8E062482-5D5D-4837-9980-D6C708DD24D4@goldelico.com> <20200420150802.GR37466@atomide.com> <D1A77603-11FB-407F-B480-82C57E742C51@goldelico.com> <20200421085336.32cf8ffe@aktux> <20200421180220.GB37466@atomide.com> <70F19A6E-7B36-4873-9364-F284A14EE3A0@goldelico.com> <20200421182017.GC37466@atomide.com> <D3E40A6A-39B8-4F3F-9ABC-28EAE8D623A6@goldelico.com> <20200422120418.49a40c75@aktux> <6E3A50D9-0F15-4A56-8C5E-7CDC63E8AF9F@goldelico.com> <A2AC3E81-49B2-4CF2-A7CF-6075AEB1B72D@goldelico.com> <44AD9673-AE02-498F-A5CC-48499DF226E3@goldelico.com>
To:     Andreas Kemnade <andreas@kemnade.info>,
        Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 25.04.2020 um 12:29 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
> H
> The things start to get "fixed" when the hdq_isr
> jumps to 6 indicating
>=20
> OMAP_HDQ_INT_STATUS_RXCOMPLETE | OMAP_HDQ_INT_STATUS_TXCOMPLETE
>=20
> So I am getting more inclined to believe that it is
> not a power management issue but some piggybacked
> change to how interrupts are handled.
> Especially hdq_reset_irqstatus.
>=20
> So I will add a printk to hdq_reset_irqstatus
> to see what value it had before being reset.

I now did check the log during boot and there is the
reverse situation. Initially it works but suddenly
hdq_isr becomes 6 and then trouble starts.

So the key problem is that both, the RX and the TX
interrupts may be set and then, the code resets
everything to 0 and looses either one.

I wonder if that is an issue by two processes reading
hdq in parallel.

Another question is how independent command-writes + result-reads
are properly serialized and locked so that they don't overlap?

Maybe this is handled outside of the omap_hdq code.

So what could be a fix?

BR,
Nikolaus
=20
[   17.026916] omap_hdq 480b2000.1w: omap_hdq_probe
[   17.057739] omap_hdq 480b2000.1w: omap_hdq_probe 1
[   17.062866] omap_hdq 480b2000.1w: omap_hdq_runtime_resume
[   17.221374] omap_hdq 480b2000.1w: OMAP HDQ Hardware Rev 0.5. Driver =
in Interrupt mode
[   17.350860] omap_hdq 480b2000.1w: omap_hdq_probe 2
[   17.372863] omap_hdq 480b2000.1w: omap_hdq_probe 3
[   17.468444] omap_hdq 480b2000.1w: hdq_isr: 1
[   17.473876] omap_hdq 480b2000.1w: Presence bit not set
[   17.505249] omap_hdq 480b2000.1w: omap_hdq_probe 4
[   17.576690] omap_hdq 480b2000.1w: omap_hdq_probe done
[   17.697998] omap_hdq 480b2000.1w: hdq_write_byte
[   17.704986] omap_hdq 480b2000.1w: hdq_isr: 4
[   17.734954] omap_hdq 480b2000.1w: hdq_read_byte
[   17.747528] omap_hdq 480b2000.1w: hdq_isr: 2
[   17.752044] omap_hdq 480b2000.1w: hdq_write_byte
[   17.759033] omap_hdq 480b2000.1w: hdq_isr: 4
[   17.774414] omap_hdq 480b2000.1w: hdq_read_byte
[   17.798767] omap_hdq 480b2000.1w: hdq_isr: 2
[   17.803314] omap_hdq 480b2000.1w: hdq_write_byte
[   17.821807] omap_hdq 480b2000.1w: hdq_isr: 4
[   17.826385] omap_hdq 480b2000.1w: hdq_read_byte
[   17.837646] omap_hdq 480b2000.1w: hdq_isr: 2
[   17.842224] omap_hdq 480b2000.1w: hdq_write_byte
[   17.849212] omap_hdq 480b2000.1w: hdq_isr: 4
[   17.861877] omap_hdq 480b2000.1w: hdq_read_byte
[   17.887573] omap_hdq 480b2000.1w: hdq_isr: 2
[   17.892150] omap_hdq 480b2000.1w: hdq_write_byte
[   17.899139] omap_hdq 480b2000.1w: hdq_isr: 4
[   17.903686] omap_hdq 480b2000.1w: hdq_read_byte
[   17.926177] omap_hdq 480b2000.1w: hdq_isr: 2
[   17.945434] omap_hdq 480b2000.1w: hdq_write_byte
[   17.953979] omap_hdq 480b2000.1w: hdq_isr: 4
[   17.959503] omap_hdq 480b2000.1w: hdq_read_byte
[   17.964294] omap_hdq 480b2000.1w: hdq_isr: 2
[   17.984436] omap_hdq 480b2000.1w: hdq_write_byte
[   18.017578] omap_hdq 480b2000.1w: hdq_isr: 6
[   18.022521] omap_hdq 480b2000.1w: hdq_read_byte
[   18.027282] omap_hdq 480b2000.1w: hdq_isr: 0
[   18.287597] omap_hdq 480b2000.1w: timeout waiting for RXCOMPLETE, 0
[   18.294250] omap_hdq 480b2000.1w: hdq_write_byte
[   18.313720] omap_hdq 480b2000.1w: hdq_isr: 0
[   18.537536] omap_hdq 480b2000.1w: TX wait elapsed
[   18.542510] omap_hdq 480b2000.1w: TX failure:Ctrl status 0
[   18.577697] omap_hdq 480b2000.1w: hdq_read_byte
[   18.582489] omap_hdq 480b2000.1w: hdq_isr: 0
[   18.787597] omap_hdq 480b2000.1w: timeout waiting for RXCOMPLETE, 0
