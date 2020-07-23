Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1427D22AC3C
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jul 2020 12:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728044AbgGWKMg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Jul 2020 06:12:36 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:35944 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727859AbgGWKMf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 Jul 2020 06:12:35 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06NACMDx128920;
        Thu, 23 Jul 2020 05:12:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1595499142;
        bh=JocIv59QpCGZ95+4xMkMFnSnQtZjJWg7KwCnL9Tm5b0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=VcfmvNq6sRqsu/m0HO3+TXh9MdK5BXYpXSVT+XHu2B8+RqfROs0vSbrVbmbPWDH1r
         kCCZxy5A4/PLngKN0lK5u10pMCwG1ZTONLxNDAv8Ug8sBwx1K6pqi45m8/dyRz5xmD
         qviJopOYJgMgq0gGHenpi6sg7Wr4t2TEga5MtYO4=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06NACMTx077547;
        Thu, 23 Jul 2020 05:12:22 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 23
 Jul 2020 05:12:21 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 23 Jul 2020 05:12:21 -0500
Received: from [10.250.233.85] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06NACICj116733;
        Thu, 23 Jul 2020 05:12:18 -0500
Subject: Re: [PATCH v8 00/15] Add PCIe support to TI's J721E SoC
To:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
CC:     Tom Joseph <tjoseph@cadence.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200722110317.4744-1-kishon@ti.com>
 <20200723100258.GA7195@e121166-lin.cambridge.arm.com>
From:   Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <bc8ec8a2-9869-c170-7497-df3b6279fe97@ti.com>
Date:   Thu, 23 Jul 2020 15:42:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200723100258.GA7195@e121166-lin.cambridge.arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 7/23/2020 3:32 PM, Lorenzo Pieralisi wrote:
> On Wed, Jul 22, 2020 at 04:33:02PM +0530, Kishon Vijay Abraham I wrote:
>> TI's J721E SoC uses Cadence PCIe core to implement both RC mode
>> and EP mode.
>>
>> The high level features are:
>>   *) Supports Legacy, MSI and MSI-X interrupt
>>   *) Supports upto GEN4 speed mode
>>   *) Supports SR-IOV
>>   *) Supports multiple physical function
>>   *) Ability to route all transactions via SMMU
>>
>> This patch series
>>   *) Add support in Cadence PCIe core to be used for TI's J721E SoC
>>   *) Add a driver for J721E PCIe wrapper
>>
>> v1 of the series can be found @ [1]
>> v2 of the series can be found @ [2]
>> v3 of the series can be found @ [5]
>> v4 of the series can be found @ [6]
>> v5 of the series can be found @ [7]
>> v6 of the series can be found @ [8]
>> v7 of the series can be found @ [9]
>>
>> Changes from v7:
>> 1) Replaced WARN with pr_warn
>> 2) Included support for "dma-ranges" property patch in this series [10]
>>
>> Changes from v6:
>> 1) Fixed bot found errors running 'make dt_binding_check'
>>
>> Changes from v5:
>> 1) Added Reviewed-by: for PATCH #6
>> 2) Protect writes to PCI_STATUS with spin_lock during raising interrupts
>>    in EP mode to reduce the time between read and write of RMW.
>>
>> Changes from v4:
>> 1) Added Reviewed-by: & Acked-by: tags from RobH
>> 2) Removed un-used accessors for pcie-cadence.h and removed having ops
>>    for read/write accessors
>> 3) Updated cdns,cdns-pcie-host.yaml to remove "mem" from reg
>>
>> Changes from v3:
>> 1) Changed the order of files in MAINTAINTERS file to fix Joe's comments
>> 2) Fixed indentation and added Reviewed-by: Rob Herring <robh@kernel.org>
>> 3) Cleaned up computing msix_tbl
>> 4) Fixed RobH's comment on J721E driver
>>
>> Changes from v2:
>> 1) Converting Cadence binding to YAML schema was done as a
>>    separate series [3] & [4]. [3] is merged and [4] is
>>    pending.
>> 2) Included MSI-X support in this series
>> 3) Added link down interrupt handling (only error message)
>> 4) Rebased to latest 5.7-rc1
>> 5) Adapted TI J721E binding to [3] & [4]
>>
>> Changes from v1:
>> 1) Added DT schemas cdns-pcie-host.yaml, cdns-pcie-ep.yaml and
>>    cdns-pcie.yaml for Cadence PCIe core and included it in
>>    TI's PCIe DT schema.
>> 2) Added cpu_addr_fixup() for Cadence Platform driver.
>> 3) Fixed subject/description/renamed functions as commented by
>>    Andrew Murray.
>>
>> [1] -> http://lore.kernel.org/r/20191209092147.22901-1-kishon@ti.com
>> [2] -> http://lore.kernel.org/r/20200106102058.19183-1-kishon@ti.com
>> [3] -> http://lore.kernel.org/r/20200305103017.16706-1-kishon@ti.com
>> [4] -> http://lore.kernel.org/r/20200417114322.31111-1-kishon@ti.com
>> [5] -> http://lore.kernel.org/r/20200417125753.13021-1-kishon@ti.com
>> [6] -> http://lore.kernel.org/r/20200506151429.12255-1-kishon@ti.com
>> [7] -> http://lore.kernel.org/r/20200522033631.32574-1-kishon@ti.com
>> [8] -> http://lore.kernel.org/r/20200708093018.28474-1-kishon@ti.com
>> [9] -> http://lore.kernel.org/r/20200713110141.13156-1-kishon@ti.com
>> [10] -> http://lore.kernel.org/r/20200521080153.5902-1-kishon@ti.com
>>
>> Alan Douglas (1):
>>   PCI: cadence: Add MSI-X support to Endpoint driver
>>
>> Kishon Vijay Abraham I (14):
>>   PCI: cadence: Use "dma-ranges" instead of "cdns,no-bar-match-nbits"
>>     property
>>   PCI: cadence: Fix cdns_pcie_{host|ep}_setup() error path
>>   linux/kernel.h: Add PTR_ALIGN_DOWN macro
>>   PCI: cadence: Convert all r/w accessors to perform only 32-bit
>>     accesses
>>   PCI: cadence: Add support to start link and verify link status
>>   PCI: cadence: Allow pci_host_bridge to have custom pci_ops
>>   dt-bindings: PCI: cadence: Remove "mem" from reg binding
>>   PCI: cadence: Add new *ops* for CPU addr fixup
>>   PCI: cadence: Fix updating Vendor ID and Subsystem Vendor ID register
>>   dt-bindings: PCI: Add host mode dt-bindings for TI's J721E SoC
>>   dt-bindings: PCI: Add EP mode dt-bindings for TI's J721E SoC
>>   PCI: j721e: Add TI J721E PCIe driver
>>   misc: pci_endpoint_test: Add J721E in pci_device_id table
>>   MAINTAINERS: Add Kishon Vijay Abraham I for TI J721E SoC PCIe
>>
>>  .../bindings/pci/cdns,cdns-pcie-host.yaml     |   8 +-
>>  .../bindings/pci/ti,j721e-pci-ep.yaml         |  94 ++++
>>  .../bindings/pci/ti,j721e-pci-host.yaml       | 113 ++++
>>  MAINTAINERS                                   |   4 +-
>>  drivers/misc/pci_endpoint_test.c              |   9 +
>>  drivers/pci/controller/cadence/Kconfig        |  23 +
>>  drivers/pci/controller/cadence/Makefile       |   1 +
>>  drivers/pci/controller/cadence/pci-j721e.c    | 493 ++++++++++++++++++
>>  .../pci/controller/cadence/pcie-cadence-ep.c  | 129 ++++-
>>  .../controller/cadence/pcie-cadence-host.c    | 310 +++++++++--
>>  .../controller/cadence/pcie-cadence-plat.c    |  13 +
>>  drivers/pci/controller/cadence/pcie-cadence.c |   8 +-
>>  drivers/pci/controller/cadence/pcie-cadence.h | 161 +++++-
>>  include/linux/kernel.h                        |   1 +
>>  14 files changed, 1297 insertions(+), 70 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/pci/ti,j721e-pci-ep.yaml
>>  create mode 100644 Documentation/devicetree/bindings/pci/ti,j721e-pci-host.yaml
>>  create mode 100644 drivers/pci/controller/cadence/pci-j721e.c
> 
> Applied to pci/cadence for v5.9, thanks !

Thank you Lorenzo!

Regards
Kishon
