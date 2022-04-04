Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB5404F1417
	for <lists+linux-omap@lfdr.de>; Mon,  4 Apr 2022 13:53:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231524AbiDDLyw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 4 Apr 2022 07:54:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232186AbiDDLyv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 4 Apr 2022 07:54:51 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 098F53D4AD
        for <linux-omap@vger.kernel.org>; Mon,  4 Apr 2022 04:52:54 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id bg10so19370589ejb.4
        for <linux-omap@vger.kernel.org>; Mon, 04 Apr 2022 04:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=7xs1Q8qlIPRjoqt2EPejT10ykTPGTWoej6GDOdjftEY=;
        b=Zxj2oHd1bQfCSsMCYHGfw+8Z+zbLbap+LrNQcV3Wg3xKwM/PPLHC6/jkZtn5Wjn4f7
         8a3tB8mgKjGFbZJHeF5kb3oXJLiFIDTtlfONmVk0K1RjSD69SobuaO89vhJXobkZ6Ddf
         xA0tT0WYDzxaPt9xi0edufW9lJdjhgig75XKNqt2pINY9ttFjvhHCRaP+Yf4OQR2lOac
         JTbD2fQro6qO79FC/5o27qhcxxX5GIr27LTPPOZkLqhwQV2DajA5i+5qfK8eED+1vkN9
         IXfmXGp8nbstbUTtfNvNzOTuNUqHM1GDmmmb24WC6lUtA9UIEPOWUd+ENGXSGjOCYEh7
         gIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=7xs1Q8qlIPRjoqt2EPejT10ykTPGTWoej6GDOdjftEY=;
        b=Rcm2yfQo3SdQyeSbcBepG8mn7iwUhBxtku/0HazQnImFqtDFrlrY1p55FY4Off9QTE
         lFeOSB6hXQIcp4dHmZFYUq025Cgn9/6H0RCzrpC4UU/VS/gPPpl5f/MBnmJU9HD9Lpp2
         qPYEph+gO2rJC9GtS3sYYW4/QEiVNrlVJJjeupJGCThnakWzOJ18mNZSS7DJe1N0fpp1
         ssopNQwCZ5veOvB/QxXNESDCfOdSexp3did00UDaqhCfbaoo9H2IIyWzP56kIpcNVXDL
         bzjDKsEXMOmui0bbQvHr+LROpLclEzgPUYt3nzLYZ+DAg8h3ps/FMlT2DFyMfSI6Wr+w
         uoBA==
X-Gm-Message-State: AOAM531zcWASH1+v6rbXPaQOlLEOMwGEsEJztlbfW49T/j7LM+KGuWTT
        UH8ZVc7cQiXo/SP4fF9pHYBmKpngfUc3oXtn4IA=
X-Google-Smtp-Source: ABdhPJyLCIX4JDzUK0LM8U7gwhHjv3ucuGkbs5yJBj8+zVbjNb6lAvFlNp9jD8ok2Eg50quR9Ru1wjBHyy+/QuYlTZk=
X-Received: by 2002:a17:907:7294:b0:6e7:edd0:a03f with SMTP id
 dt20-20020a170907729400b006e7edd0a03fmr4933721ejc.455.1649073172094; Mon, 04
 Apr 2022 04:52:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:907:7e99:0:0:0:0 with HTTP; Mon, 4 Apr 2022 04:52:51
 -0700 (PDT)
Reply-To: belindasteenkamp14@gmail.com
From:   BELINDA STEENKAMP <tiffanysmithforreal17@gmail.com>
Date:   Mon, 4 Apr 2022 13:52:51 +0200
Message-ID: <CAJSMfVbMSBF-392cCXBPtHHiGHb+S4M3se+eEwq4HFYLSOkpBQ@mail.gmail.com>
Subject: Easter Promotion!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:636 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [belindasteenkamp14[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [tiffanysmithforreal17[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [tiffanysmithforreal17[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.8 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

--=20
PROMOTION WITH 2% INTEREST RATE

  We offer Loans ranging from (R10,000.00 =E2=80=93 R5,000,000.00). Loan
duration is from 1 to 20 years (Maximum) No collateral, No ITC CHECK
and Blacklisted, Under debt review, No pay slip, Low credit, Self
employed and Business owners are welcome.

CONTACT:
Belinda Steenkamp (Mrs)
Senior Loan Consultant,
Call only ... { +27671850879 }
Whatsapp only... ( +27677352072
Email: { belindasteenkamp14@gmail.com }
